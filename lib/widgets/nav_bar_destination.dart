import '../exports.dart';

class StyledNavDest extends StatelessWidget {
  const StyledNavDest({super.key, required this.label, required this.icon});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: label,
    );
  }
}
