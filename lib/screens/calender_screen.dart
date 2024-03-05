import '../exports.dart';
import 'package:intl/intl.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  late TextEditingController _controller;
  late List<TodoItem> _todos;
  late Map<DateTime, List<TodoItem>> _events;
  late DateTime _focusedDay;
  late DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _todos = [];
    _events = {};
    _focusedDay = DateTime.now();
    _selectedDay = null;
    _loadData();
    _loadEvents();
  }

  Future<void> _loadData() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/todos.json');
      if (file.existsSync()) {
        final jsonStr = await file.readAsString();
        setState(() {
          _todos = List<TodoItem>.from(
              json.decode(jsonStr).map((x) => TodoItem.fromJson(x)));
        });
      }
    } catch (e) {
      print('Error loading todos: $e');
    }
  }

  Future<void> _saveData() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/todos.json');
      final jsonStr = json.encode(_todos);
      await file.writeAsString(jsonStr);
    } catch (e) {
      print('Error saving todos: $e');
    }
  }

  Future<void> _loadEvents() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/events.json');
      if (file.existsSync()) {
        final jsonStr = await file.readAsString();
        setState(() {
          _events = Map<DateTime, List<TodoItem>>.from(json.decode(jsonStr).map(
                (key, value) => MapEntry(
                    DateTime.parse(key),
                    List<TodoItem>.from(
                        value.map((x) => TodoItem.fromJson(x)))),
              ));
        });
      }
    } catch (e) {
      print('Error loading events: $e');
    }
  }

  Future<void> _saveEvents() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/events.json');
      final jsonStr = json.encode(_events);
      await file.writeAsString(jsonStr);
    } catch (e) {
      print('Error saving events: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcement'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2022, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarFormat: CalendarFormat.month,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(fontSize: 20.0),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle(
                  color: Colors
                      .red), // Change color of Saturday and Sunday letters
            ),
            calendarBuilders: CalendarBuilders(
              todayBuilder: (context, date, _) {
                // Custom styling for specific dates
                if (date.weekday == DateTime.saturday ||
                    date.weekday == DateTime.sunday) {
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red.withOpacity(0.5),
                    ),
                    child: Center(
                      child: Text(
                        '${date.day}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        '${date.day}',
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final todo = _todos[index];
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      title: Text(todo.title),
                      subtitle: Text(todo.date != null
                          ? 'Date: ${DateFormat('dd MMMM yyyy').format(todo.date!)}'
                          : 'No Date'),
                      onLongPress: () {
                        setState(() {
                          _todos.removeAt(index);
                          _saveData();
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Add Todo',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    _showAddTodoDialog();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddTodoDialog() async {
    final titleController = TextEditingController();
    DateTime? selectedDate;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Todo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2030),
                );
              },
              child: Text('Select Date'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final title = titleController.text.trim();
              if (title.isNotEmpty) {
                final todo = TodoItem(title: title, date: selectedDate);
                setState(() {
                  _todos.add(todo);
                  _saveData();
                  _addToEvents(todo);
                });
              }
              Navigator.pop(context);
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void _addToEvents(TodoItem todo) {
    if (todo.date != null) {
      final date = todo.date!;
      if (_events.containsKey(date)) {
        setState(() {
          _events[date]!.add(todo);
          _saveEvents();
        });
      } else {
        setState(() {
          _events[date] = [todo];
          _saveEvents();
        });
      }
    }
  }
}

class TodoItem {
  final String title;
  final DateTime? date;

  TodoItem({required this.title, this.date});

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
      title: json['title'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date?.toIso8601String(),
    };
  }
}
