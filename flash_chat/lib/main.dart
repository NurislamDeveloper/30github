import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/wellcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      initialRoute: WellcomeScreen.id,
      routes: {
        WellcomeScreen.id:(context) => const WellcomeScreen(),
        LoginScreen.id:(context) =>const LoginScreen(),
        RegistrationScreen.id:(context) => const RegistrationScreen(),
        ChatScreen.id:(context) => const ChatScreen(),
      },      
    );
  }
}
