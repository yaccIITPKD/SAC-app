import 'package:flutter/material.dart';
import '../widgets/home_screen_clubs.dart';
class HomeScreen extends StatefulWidget {

  static String id = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                child: const Text("Announcements"),
                // color: Colors.blue,
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ClubCard(clubName: "YACC",clubIntro: "The Coding Club",imagePath: 'images/yacc.jpg', clubHead: "Nideesh N,Jyothiradithya,Syed Abdul Mateen,Rishav Kumar,Saarang S,Lekshmi R Nair,Yukta Salunkhe,Nilesh Jamre,Priyanshu Gupta", clubEmail: "yacc@iitpkd.ac.in",),
                  ClubCard(clubName: "ShutterBug",clubIntro: "The Photography Club",imagePath: 'images/shutterbug.png', clubHead: "Utsav Patel", clubEmail: "shutterbug@iitpkd.ac.in", headContactNum: "1234567891",),
                  ClubCard(clubName: "Akshar",clubIntro: "The Literary Club",imagePath: 'images/akshar.jpg', clubHead: "Sarath A", clubEmail: "akshar@iitpkd.ac.in",),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

