import '../exports.dart';

class StyledNavDest extends StatelessWidget {
  const StyledNavDest(
      {super.key, required this.label, required this.icon, this.iconTint});
  final IconData icon;
  final String label;
  final Color? iconTint;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(
        icon,
        color: iconTint,
      ),
      label: label,
    );
  }
}
