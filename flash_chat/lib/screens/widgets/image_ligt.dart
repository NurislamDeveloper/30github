import 'package:flutter/material.dart';

class ImageLigt extends StatelessWidget {
  const ImageLigt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: SizedBox(
        height: 200.0,
        child: Image.asset('assets/images/flash.png'),
      ),
    );
  }
}
