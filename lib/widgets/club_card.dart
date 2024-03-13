import '../exports.dart';

// This widget is customized to display different clubs on the homescreen

class ClubCard extends StatelessWidget {
  // Takes the following data
  final String clubName;
  final String clubIntro;
  final String imagePath;
  final String clubHead;
  final String? headContactNum;
  final String clubEmail;

  const ClubCard({
    Key? key,
    required this.clubName,
    required this.clubIntro,
    required this.imagePath,
    required this.clubHead,
    required this.clubEmail,
    this.headContactNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // on clicking it navigates to the respective club screen
    return ClickableCard(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClubScreen(
              clubName: clubName,
              clubImage: imagePath,
              clubHead: clubHead,
              clubEmail: clubEmail,
              headContactNum: headContactNum,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              // child: Image.asset(imagePath, alignment: Alignment.center,),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fill,
                ),
              ),
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
          const SizedBox(height: 8)
        ],
      ),
    );
  }
}
