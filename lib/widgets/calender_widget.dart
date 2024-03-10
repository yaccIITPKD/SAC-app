import '../exports.dart';

// Import directly from intl library
// Because conflicting with dart:ui in exports.dart
import 'package:intl/intl.dart';

class CalenderWidget extends StatelessWidget {
  final double height;
  final double width;
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime focusedDay;
  final bool Function(DateTime day)? selectedDayPredicate;
  final Function(DateTime, DateTime)? onDaySelected;
  final CalendarFormat calendarFormat;
  final CalendarBuilders calendarBuilders;

  const CalenderWidget(
      {Key? key,
      this.height = 350,
      this.width = 330,
      required this.firstDay,
      required this.lastDay,
      required this.focusedDay,
      this.selectedDayPredicate,
      this.onDaySelected,
      this.calendarFormat = CalendarFormat.month,
      this.calendarBuilders = const CalendarBuilders()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryContainer = ThemeUtils.primContainerColor(context);
    Color primary = ThemeUtils.getColorScheme(context).primary;
    Color onPrimary = ThemeUtils.getColorScheme(context).onPrimary;
    Color surface = ThemeUtils.getColorScheme(context).surface;
    Color onSurface = ThemeUtils.getColorScheme(context).onSurface;
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        decoration: BoxDecoration(color: primaryContainer),
        height: height,
        width: width,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: TableCalendar(
          firstDay: firstDay,
          lastDay: lastDay,
          focusedDay: focusedDay,
          calendarFormat: calendarFormat,
          selectedDayPredicate: selectedDayPredicate,
          onDaySelected: onDaySelected,
          calendarBuilders: calendarBuilders,
          shouldFillViewport: true,
          daysOfWeekHeight: 40,
          daysOfWeekStyle: DaysOfWeekStyle(
            dowTextFormatter: (date, locale) {
              return DateFormat.E(locale).format(date)[0];
            },
            weekdayStyle: const TextStyle(fontWeight: FontWeight.bold),
            weekendStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
          headerStyle: HeaderStyle(
              headerPadding: const EdgeInsets.all(0),
              titleTextStyle: TextStyle(
                color: onPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              leftChevronIcon: Icon(
                Icons.arrow_left_rounded,
                color: onPrimary,
              ),
              rightChevronIcon: Icon(
                Icons.arrow_right_rounded,
                color: onPrimary,
              ),
              leftChevronMargin: const EdgeInsets.symmetric(),
              rightChevronMargin: const EdgeInsets.symmetric(),
              leftChevronPadding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
              rightChevronPadding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
              formatButtonVisible: false,
              titleCentered: true,
              decoration: BoxDecoration(color: primary)),
          calendarStyle: CalendarStyle(
            tablePadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            rowDecoration: BoxDecoration(
                color: surface,
                border: Border.all(color: primaryContainer, width: 4),
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            todayDecoration: BoxDecoration(
              color: primary.withOpacity(0.3),
              shape: BoxShape.circle,
              border: Border.all(color: surface, width: 1),
            ),
            selectedDecoration: BoxDecoration(
              color: primary,
              shape: BoxShape.circle,
              border: Border.all(color: surface, width: 1),
            ),
            todayTextStyle: TextStyle(color: onSurface),
            selectedTextStyle: TextStyle(color: onPrimary),
          ),
        ),
      ),
    );
  }
}
