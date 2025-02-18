// Logo Row Widget
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';


class LogoRow extends StatelessWidget {
  const LogoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: 'logo',
          child: SizedBox(
            height: 50.0,
            child: Image.asset('assets/images/flash.png'),
          ),
        ),
        // ignore: deprecated_member_use
        TypewriterAnimatedTextKit( // here with this widget it animated like it really is I have just install the package and use inside the text it's actually list it takes more the to line of text 
          text: const [
            'Flash Chat',
          ],
          speed: const Duration(milliseconds: 200),
        
          textStyle: const TextStyle(
            fontSize: 45.0,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
