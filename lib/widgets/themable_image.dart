import 'package:flutter/material.dart';

class ThemableImage extends StatelessWidget {
  final String lightModeImagePath;
  final String darkModeImagePath;
  final double? width;
  final double? height;

  const ThemableImage(
      {super.key,
      required this.lightModeImagePath,
      required this.darkModeImagePath,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    String imagePath = isDarkMode ? darkModeImagePath : lightModeImagePath;

    return Image.asset(
      imagePath,
      width: width,
      height: height,
    );
  }
}
