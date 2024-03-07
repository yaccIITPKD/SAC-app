import '../exports.dart';
// The screen which displays information about a club
// Only contact details and minor data available right now

class ClubScreen extends StatelessWidget {
  static String id = "ClubScreen";

  // const ClubScreen({super.key});
  // Take important information from previous screen
  ClubScreen({
    required this.clubName,
    required this.clubImage,
    required this.clubHead,
    required this.clubEmail,
    this.headContactNum,
  });
  final String clubName;
  final String clubImage;
  final String clubHead;
  late final String? headContactNum;
  final String clubEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(clubName),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Image.asset(clubImage),
            Text(
              "Club head:\n$clubHead",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Club Email: \n$clubEmail",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            headContactNum == null
                ? const Text(
                    "No contact number",
                    style: TextStyle(fontSize: 16),
                  )
                : Text(
                    "Head contact Number:\n$headContactNum",
                    style: const TextStyle(fontSize: 16),
                  ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationScreen(
                      clubName: clubName,
                    ),
                  ),
                );
              },
              child: const Text("Join Club"),
            ),
          ],
        ),
      ),
    );
  }
}
