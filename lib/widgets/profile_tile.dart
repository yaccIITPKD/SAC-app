import 'package:flutter/material.dart';
import 'package:sac_app/provider/constants.dart';

class ProfileTile extends StatelessWidget {
  final double? height;
  final double? width;
  final String? userName;
  final String? userImage;
  final String userEmail;

  const ProfileTile(
      {super.key,
      this.height,
      this.width,
      this.userName,
      this.userImage,
      required this.userEmail});

  @override
  Widget build(BuildContext context) {
    double widgetWidth = width ?? 300;
    double size = widgetWidth / 8;
    return Container(
      width: widgetWidth,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfileImage(
              size: size,
              userName: userName,
              userImage: userImage,
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Text(userName ?? ''),
                Text(userEmail, style: TextStyle(fontSize: 12))
              ],
            )
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
            child: SizedBox(
              height: (size ?? 24) - 15,
              width: (size ?? 24) - 15,
              child: FittedBox(
                child: Text(intial),
              ),
            ),
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
