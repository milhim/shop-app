import 'package:flutter/material.dart';
import 'package:shop_app/components/page_headers.dart';
import 'package:shop_app/components/social_icon.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/sign_in/components/sign_in_form.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ScreenHeader(
                    title: 'Welcome Back',
                    secondaryTitle:
                        'Sign in with your email and password \n or continue with social media'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                SignForm(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcon(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocialIcon(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocialIcon(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      // onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 16, color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
