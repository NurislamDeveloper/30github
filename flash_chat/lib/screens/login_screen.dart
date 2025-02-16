import 'package:flash_chat/screens/widgets/cutsom_text_field.dart';
import 'package:flash_chat/screens/widgets/image_ligt.dart';
import 'package:flash_chat/screens/widgets/routed_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              height: 10.0,
            ),
            CustomTextField(
              onChanged: (value) {},
              hintext: 'Enter your name ',
            ),
            const SizedBox(
              height: 20.0,
            ),
            RoundedButton(
              text: 'Log In',
              color: Colors.blueAccent,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
