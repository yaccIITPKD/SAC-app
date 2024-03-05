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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // ---------------------------------------
        // App Bar
        // The layout of app bar is like this
        // A Row -> Inside it a logo, column -> Inside it 2 texts
        // Actions in which theme change symbol is there
        //---------------------------------------
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Image is made flexible so app wouldn't crash
              Flexible(
                child: Image(
                  image: AssetImage("assets/logo/light.png"),
                  height: 60,
                  width: 50,
                ),
              ),
              SizedBox(width: 15),
              // If app is crashing here, wrap column with flexible widget
              Column(
                children: <Widget>[
                  Text(
                    "Students Affairs Council",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "IIT, Palakkad",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            // The theme of the app is updated using provider package
            IconButton(
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
          ],
        ),
        //---------------------------------------
        // Body
        //---------------------------------------
        body: bodyWidgets[currentPageIndex],
        //---------------------------------------
        // Bottom Navigation bar
        //---------------------------------------
        bottomNavigationBar: NavigationBar(
          indicatorColor: Colors.amber,
          backgroundColor: const Color(0xFFF38221),
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            StyledNavDest(label: 'Home', icon: Icons.home),
            StyledNavDest(label: 'Events', icon: Icons.calendar_month),
            StyledNavDest(label: 'Projects', icon: Icons.lightbulb),
            StyledNavDest(label: 'Settings', icon: Icons.person),
          ],
        ),
      ),
    );
  }
}
