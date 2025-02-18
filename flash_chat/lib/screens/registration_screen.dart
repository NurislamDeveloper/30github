import 'package:flash_chat/screens/widgets/cutsom_text_field.dart';
import 'package:flash_chat/screens/widgets/image_ligt.dart';
import 'package:flash_chat/screens/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  static const String id = 'registration_screen';
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ImageLigt(),
            const SizedBox(
              height: 25.0,
            ),
            CustomTextField(
              onChanged: (value) {},
              hintext: 'Enter your name ',
            ),
            const SizedBox(
              height: 30.0,
            ),
            CustomTextField(
              onChanged: (value) {},
              hintext: 'Enter your name ',
            ),
            const SizedBox(
              height: 40.0,
            ),
            RoundedButton(
              text: 'Registration',
              color: Colors.blueAccent,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
