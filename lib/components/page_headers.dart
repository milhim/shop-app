import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop_app/constants.dart';

class ScreenHeader extends StatelessWidget {
  final String title;
  final String secondaryTitle;
  const ScreenHeader(
      {super.key, required this.title, required this.secondaryTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              color: kTextColor, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Text(
          secondaryTitle,
          textAlign: TextAlign.center,
          style: TextStyle(color: kSecondaryColor),
        ),
      ],
    );
  }
}
