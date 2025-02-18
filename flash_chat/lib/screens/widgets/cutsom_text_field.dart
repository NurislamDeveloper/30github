import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintext,
    required this.onChanged,
  });

  final String hintext;
  final  Function(String ) ? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: Constants.inputDecoration.copyWith(hintText: hintext),
      // it's also good thing I should deeger more whatever to learn it 
    );
  }
}
