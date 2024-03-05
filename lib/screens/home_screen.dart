import '../exports.dart';

class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _announcements = [];
  List<List<String>> _clubs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _announcements = [
      "Hello",
      "World",
      "Hi",
    ];
    _clubs = [
      [
        "YACC",
        "The Coding Club",
        'assets/images/yacc.jpg',
        "Nideesh N,Jyothiradithya,Syed Abdul Mateen,Rishav Kumar,Saarang S,Lekshmi R Nair,Yukta Salunkhe,Nilesh Jamre,Priyanshu Gupta",
        "yacc@iitpkd.ac.in",
        "1234567891",
      ],
      [
        "ShutterBug",
        "The Photography Club",
        'assets/images/shutterbug.png',
        "Utsav Patel",
        "shutterbug@iitpkd.ac.in",
        "1234567891",
      ],
      [
        "Akshar",
        "The Literary Club",
        'assets/images/akshar.jpg',
        "Sarath A",
        "akshar@iitpkd.ac.in",
        "1234567891",
      ],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text("Clubs"),
          Expanded(
            flex: 1,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                for (int i = 0; i < _clubs.length; i++)
                  ClubCard(
                    clubName: _clubs[i][0],
                    clubIntro: _clubs[i][1],
                    imagePath: _clubs[i][2],
                    clubHead: _clubs[i][3],
                    clubEmail: _clubs[i][4],
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text("Announcements"),
          // Announcement List
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: _announcements.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: AnnouncementCard(content: _announcements[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
