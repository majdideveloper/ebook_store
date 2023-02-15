import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_own_ebook/resources/auth_methods.dart';
import 'package:my_own_ebook/screens/auth/forget_password_screen.dart';
import 'package:my_own_ebook/screens/auth/register_screen.dart';
import 'package:my_own_ebook/screens/auth/widget/auth_button.dart';
import 'package:my_own_ebook/screens/auth/widget/textfield_auth.dart';
import 'package:my_own_ebook/screens/bottom_bar/bottom_bar.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';
import '../../utils/constants.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _obscureText = true;
  @override
  void dispose() {
    _emailTextController.dispose();
    _passTextController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  void _submitFormOnLogin() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      print('THe form is valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            color: Colors.white.withOpacity(0.7),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Constants.smallPaddingHor,
                  Image.asset(
                    'assets/images/logo marron.png',
                    height: 100,
                    width: 150,
                  ),
                  const SizedBox(
                    height: 120.0,
                  ),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Constants.smallPaddingHor,
                  const Text(
                    'Sign Up to continue',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          MyTextField(
                            controller: _emailTextController,
                            hintText: 'email',
                            obscureText: false,
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Please enter a valid email address';
                              } else {
                                return null;
                              }
                            },
                          ),
                          Constants.smallPaddingHor,
                          MyTextField(
                            controller: _passTextController,
                            hintText: 'password',
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 6) {
                                return 'Please enter a valid password';
                              } else {
                                return null;
                              }
                            },
                          ),

                          //Password
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    ForgetPasswordScreen())));
                      },
                      child: const Text(
                        'Forget password?',
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthButton(
                    fct: () async {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a Snackbar.
                        String res = await AuthMethods().loginUser(
                            email: _emailTextController.text,
                            password: _passTextController.text);
                        await context.read<UserProvider>().refreshUser();
                        if (res == "success") {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomBar()),
                              (route) => false);
                        }
                      }
                    },
                    buttonText: 'Login',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: const TextStyle(
                              color: Colors.orangeAccent, fontSize: 18),
                          children: [
                        TextSpan(
                            text: '  Sign up',
                            style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            RegisterScreen())));
                              }),
                      ]))
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
