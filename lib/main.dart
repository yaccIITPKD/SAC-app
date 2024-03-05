import '../exports.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'SAC',
      theme: Provider.of<ThemeModel>(context).currentTheme,
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => Home(),
        ProjectScreen.id: (context) => ProjectScreen(),
        NewProjectScreen.id: (context) => NewProjectScreen(),
        OngoingProjectScreen.id: (context) => OngoingProjectScreen(),
      },
    );
  }
}
