// Logo Row Widget
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
        const Text(
          'Flash Chat',
          style: TextStyle(
            fontSize: 45.0,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}