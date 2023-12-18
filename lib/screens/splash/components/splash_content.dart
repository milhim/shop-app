import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class SplashContent extends StatelessWidget {
  final String text;
  final String image;
  const SplashContent({
    required this.text,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          "Double-M",
          style: TextStyle(
              fontSize: 36, color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: 300,
          width: 250,
        )
      ],
    );
  }
}
