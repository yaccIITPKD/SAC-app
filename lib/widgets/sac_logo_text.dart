import '../exports.dart';

class SACLogoText extends StatelessWidget {
  final double width;
  const SACLogoText({Key? key, this.width = 250}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color accent = ThemeUtils.getColorScheme(context).primary;
    return SizedBox(
      height: width + 50,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ThemableImage(
            lightModeImagePath: lightLogoPath,
            darkModeImagePath: darkLogoPath,
            width: width * 0.8,
            height: width * 0.8,
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
