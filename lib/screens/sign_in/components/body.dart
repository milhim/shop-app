import 'package:flutter/material.dart';
import 'package:shop_app/components/auth_text_form_field.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/components/social_icon.dart';
import 'package:shop_app/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

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
                Text(
                  'Welcome Back',
                  style: TextStyle(
                      color: kTextColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  'Sign in with your email and password \n or continue with social media',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kSecondaryColor),
                ),
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

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool _rememberMeValue = false;

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: inputDecoration(
              hintText: "Enter your email",
              labelText: "Email",
              iconPath: "assets/icons/Mail.svg",
            ),
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: kInvalidEmailError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kEmailNullError);
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                return "";
              }
              return null;
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          TextFormField(
            obscureText: true,
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              } else if (value.length >= 8) {
                removeError(error: kShortPassError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPassNullError);
                return "";
              } else if (value.length < 8) {
                addError(error: kShortPassError);
                return "";
              }
              return null;
            },
            decoration: inputDecoration(
              hintText: "Enter your password",
              labelText: "Password",
              iconPath: "assets/icons/Lock.svg",
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Row(
            children: [
              Checkbox(
                value: _rememberMeValue,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    _rememberMeValue = value!;
                  });
                },
              ),
              const Text("Remember me"),
              Spacer(),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: kPrimaryColor,
                        decoration: TextDecoration.underline),
                  )),
            ],
          ),
          // FormError(errors: errors),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          FormError(errors: errors),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          DefaultButton(
            text: 'Login',
            onPress: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                // if all are valid then go to success screen
                // KeyboardUtil.hideKeyboard(context);
                // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }
}
