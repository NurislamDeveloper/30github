import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/widgets/logrow.dart';
import 'package:flash_chat/screens/widgets/routed_button.dart';
import 'package:flutter/material.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({super.key});
  static const String id = 'wellcome_screen';

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController conrtoller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    conrtoller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(conrtoller);
    conrtoller.forward();

    conrtoller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  @override
  void dispose() {
    conrtoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const LogoRow(),
            const SizedBox(height: 48.0),
            RoundedButton(
              text: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () {
                // Navigate to Login Screen
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            const SizedBox(height: 30),
            RoundedButton(
              text: 'Registration',
              color: Colors.blueAccent,
              onPressed: () {
                // Navigate to Registration Screen
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
