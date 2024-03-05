import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sac_app/screens/ongoing_project_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sac_app/screens/user_profile_screen.dart';
import '../provider/theme_toggler.dart';
import 'calender_screen.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const id = "main_screen";
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;
  bool isDark = false;

  final Map<int, Widget> bodyWidgets = {
    0: HomeScreen(),
    1: CalenderScreen(),
    3: UserProfileScreen(),
    2: OngoingProjectScreen(),
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
          title: const Text("SAC"),
          actions: [
            Tooltip(
              message: 'Change brightness mode',
              child: IconButton(
                isSelected: isDark,
                onPressed: () {
                  setState(() {
                    isDark = !isDark;
                  });
                  Provider.of<ThemeModel>(context, listen: false).toggleTheme();
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
