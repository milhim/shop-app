import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/components/page_headers.dart';
import 'package:shop_app/constants.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String routName = "/forgot_password";

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  String? email;

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                  ScreenHeader(
                      title: 'Forgot Password',
                      secondaryTitle:
                          'Please enter your email and we will send \n you a link to reset your password'),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  TextFormField(
                    controller: _emailController,
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  FormError(errors: errors),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  DefaultButton(
                    text: 'Send',
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
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
      ),
    );
  }
}
