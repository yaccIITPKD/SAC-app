import '../exports.dart';

class SACLogoText extends StatelessWidget {
  final double? width;
  final double? height;
  const SACLogoText({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color accent = isDarkMode ? primaryColorNight : primaryColor;
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ThemableImage(
            lightModeImagePath: lightLogoPath,
            darkModeImagePath: darkLogoPath,
            width: (width ?? 200) * 0.75,
            height: (width ?? 200) * 0.75,
          ),
          const Expanded(child: SizedBox()),
          const FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(sac),
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              iitPKD,
              style: TextStyle(
                color: accent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
