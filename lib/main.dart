import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sac_app/provider/theme_toggler.dart';
import 'package:sac_app/screens/calender_screen.dart';
import 'package:sac_app/screens/club_info_screen.dart';
import 'package:sac_app/screens/club_info_screen.dart';
import 'package:sac_app/screens/home_screen.dart';
import 'package:sac_app/screens/login_screen.dart';
import 'package:sac_app/screens/new_project_screen.dart';
import 'package:sac_app/screens/ongoing_project_screen.dart';
import 'package:sac_app/screens/project_screen.dart';
import 'package:sac_app/screens/main_screen.dart';
import 'package:sac_app/screens/register_in_club_screen.dart';
import 'package:sac_app/screens/user_profile_screen.dart';
import 'package:sac_app/screens/user_profile_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAC',
      theme: Provider.of<ThemeModel>(context).currentTheme,
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => Home(),
        ProjectScreen.id : (context) => ProjectScreen(),
        NewProjectScreen.id: (context) => NewProjectScreen(),
        OngoingProjectScreen.id: (context) => OngoingProjectScreen(),
      },
    );
  }
}
