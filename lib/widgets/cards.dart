import '../exports.dart';

class FilledCard extends StatelessWidget {
  final Color? surfaceColor;
  final double cornerRadius;
  final EdgeInsets? margin;
  final Clip? clipBehaviour;
  final Widget child;

  const FilledCard(
      {Key? key,
      this.surfaceColor,
      this.cornerRadius = 15,
      this.margin,
      this.clipBehaviour,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = surfaceColor ?? ThemeUtils.cardBackgroundColor(context);
    return Card(
      elevation: 0,
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(cornerRadius))),
      clipBehavior: clipBehaviour,
      margin: margin,
      child: child,
    );
  }
}

class ClickableCard extends StatelessWidget {
  final Color? surfaceColor;
  final Color? highlightColor;
  final double cornerRadius;
  final EdgeInsets? margin;
  final Clip? clipBehaviour;
  final Function()? onTap;
  final Function()? onLongPress;
  final Function()? onDoubleTap;
  final Widget child;

  const ClickableCard(
      {Key? key,
      this.surfaceColor,
      this.highlightColor,
      this.cornerRadius = 15,
      this.margin,
      this.clipBehaviour,
      this.onTap,
      this.onLongPress,
      this.onDoubleTap,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color scrim = highlightColor ??
        ThemeUtils.getColorScheme(context).primary.withAlpha(40);
    return FilledCard(
      surfaceColor: surfaceColor,
      cornerRadius: cornerRadius,
      clipBehaviour: clipBehaviour,
      margin: margin,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
        focusColor: scrim,
        highlightColor: scrim,
        hoverColor: scrim,
        splashColor: scrim,
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        child: child,
      ),
    );
  }
}

class SectionView extends StatelessWidget {
  final String header;
  final List<String> items;

  const SectionView({super.key, required this.header, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _getwidgets(header, items),
    );
  }

  List<Widget> _getwidgets(String header, List<String> items) {
    List<Widget> widgets = [
      Row(
        children: [
          const Icon(
            Icons.circle,
            size: 8,
          ),
          const SizedBox(width: 5),
          Text(header)
        ],
      )
    ];

    for (String text in items) {
      widgets.add(Text('- $text'));
    }

    return widgets;
  }
}
