import 'package:flutter/material.dart';
import 'package:shop_app/screens/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routName = "/sign_in";
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Body(),
    );
  }
}
