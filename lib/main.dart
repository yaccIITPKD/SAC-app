import '../exports.dart';

// This is the starting point of our app, the first function that will be run when we start the app
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GlobalDataProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SAC',
      theme: Provider.of<GlobalDataProvider>(context).currentTheme,
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
