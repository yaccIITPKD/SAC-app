import '../exports.dart';

// This is the skeleton of our app
// Here we divide the app into 3 basic parts
// 1) App bar 2) Body 3) Bottom Navigation bar

class Home extends StatefulWidget {
  const Home({super.key});

  static const id = "main_screen";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDark = false;
  int currentPageIndex = 0;

  final Map<int, Widget> bodyWidgets = {
    0: HomeScreen(),
    1: CalenderScreen(),
    2: OngoingProjectScreen(),
    3: UserProfileScreen(),
  };

  @override
  void initState() {
    super.initState();

    loginStatus();
  }

  Future<void> loginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (!isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [
            Tooltip(
              message: 'Change brightness mode',
              child: IconButton(
                isSelected: isDark,
                onPressed: () {
                  setState(() {
                    isDark = !isDark;
                  });
                  Provider.of<GlobalDataProvider>(context, listen: false)
                      .toggleTheme();
                },
                icon: const Icon(Icons.wb_sunny_outlined),
                selectedIcon: const Icon(Icons.brightness_2_outlined),
              ),
            )
          ],
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.amber,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month),
              label: 'Calender',
            ),
            NavigationDestination(
              icon: Icon(Icons.grade),
              label: 'Projects',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Settings',
            ),
          ],
        ),
        body: bodyWidgets[currentPageIndex],
      ),
    );
  }
}
