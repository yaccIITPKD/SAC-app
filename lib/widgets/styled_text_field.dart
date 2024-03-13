import '../exports.dart';
// Customized text box widget
class StyledTextField extends StatelessWidget {
  final String text;
  const StyledTextField({
    required this.text,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: text,
          contentPadding: const EdgeInsets.all(16),
          filled: true,
        ),
      ),
    );
  }
}
