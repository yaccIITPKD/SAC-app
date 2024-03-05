import 'package:flutter/material.dart';
import 'package:sac_app/screens/club_info_screen.dart';

class ClubCard extends StatelessWidget {
  final String clubName;
  final String clubIntro;
  final String imagePath;
  final String clubHead;
  final String? headContactNum;
  final String clubEmail;

  const ClubCard(
      {required this.clubName,
      required this.clubIntro,
      required this.imagePath,
        required this.clubHead,
        required this.clubEmail,
        this.headContactNum,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ClubScreen(clubName: clubName, clubImage: imagePath, clubHead: clubHead,clubEmail: clubEmail, headContactNum: headContactNum,),
          ),
        );
      },
      child: SizedBox(
        width: 220,
        child: Card(
          // color: const Color(0xFFFFF5E0),
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: Image.asset(imagePath, alignment: Alignment.center,),
                  child: Image(image: AssetImage(imagePath),),
                ),
              ),
              Text(
                clubName,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              Text(
                clubIntro,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
