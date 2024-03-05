import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {

  final String clubName;
  const RegistrationScreen({required this.clubName,super.key});

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
          StyledTextField(text: 'Name',),
          StyledTextField(text: 'Email',),
          StyledTextField(text: 'Batch',),
          StyledTextField(text: 'Whatsapp number',),
          StyledTextField(text: 'Link to Work related to club',),
          const SizedBox(
            height: 20,
          ),
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
