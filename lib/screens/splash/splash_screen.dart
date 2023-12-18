import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop_app/screens/splash/components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
