import '../exports.dart';

class ProfileTile extends StatelessWidget {
  final double width;
  final String? userName;
  final String? userImage;
  final String userEmail;

  const ProfileTile(
      {super.key,
      this.width = 250,
      this.userName,
      this.userImage,
      required this.userEmail});

  @override
  Widget build(BuildContext context) {
    double size = width * 0.4;
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileImage(
              size: size,
              userName: userName,
              userImage: userImage,
            ),
            const SizedBox(height: 25),
            FittedBox(child: Text(userName ?? '')),
            const SizedBox(height: 1),
            FittedBox(
              child: Text(
                userEmail,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  final double? size;
  final String? userName;
  final String? userImage;

  const ProfileImage({super.key, this.size, this.userName, this.userImage});

  String parseName(String? name) {
    if (name == null) {
      return '';
    }

    RegExp numeric = RegExp(r'^-?[0-9]+$');
    if (numeric.hasMatch(name[0])) {
      return '';
    }

    List<String> parts = name.split(' ');
    if (parts.length >= 2) {
      return parts[0][0] + parts[1][0];
    }

    return name[0];
  }

  Widget noImage(String? name, double radius) {
    String intial = parseName(userName);
    return intial == ''
        ? CircleAvatar(
            backgroundColor: Colors.grey[700],
            radius: radius,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                userImagePath,
                fit: BoxFit.fill,
                color: Colors.white,
              ),
            ),
          )
        : CircleAvatar(
            radius: radius,
            backgroundColor: Colors.amber,
            child: FittedBox(
                child: SizedBox(
              height: size,
              width: size,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: FittedBox(
                  child: Text(intial),
                ),
              ),
            )),
          );
  }

  @override
  Widget build(BuildContext context) {
    return userImage != null
        ? CircleAvatar(
            radius: (size ?? 24) / 2,
            backgroundImage: NetworkImage(userImage!),
            backgroundColor: Colors.transparent,
          )
        : noImage(userName, (size ?? 24) / 2);
  }
}
