import '../exports.dart';

class PrefTile {
  final String title;
  final String category;
  String? subtitle;
  IconData? icon;
  Function()? onTap;

  PrefTile(
      {required this.title,
      required this.category,
      this.subtitle,
      this.icon,
      this.onTap});
}
