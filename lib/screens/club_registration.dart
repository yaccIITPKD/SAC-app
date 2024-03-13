import '../exports.dart';
// Registration page for clubs
class RegistrationScreen extends StatefulWidget {
  // takes clubName from previous screen
  final String clubName;
  const RegistrationScreen({required this.clubName, super.key});

  static const id = "registration_screen";

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register",
        ),
        // centerTitle: true,
      ),
      body: ListView(
        children: [
          // customized widgets for different field (other fields from backend can also be added in same way)
          StyledTextField(
            text: 'Name',
          ),
          StyledTextField(
            text: 'Email',
          ),
          StyledTextField(
            text: 'Batch',
          ),
          StyledTextField(
            text: 'Whatsapp number',
          ),
          StyledTextField(
            text: 'Link to Work related to club',
          ),
          const SizedBox(
            height: 20,
          ),
          // register button- requires backend to show functionality
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 200,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                // style:
                // ElevatedButton.styleFrom(backgroundColor: kLightBluishBg),
                child: const Text(
                  "Register",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

