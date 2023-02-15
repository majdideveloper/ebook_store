import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:my_own_ebook/resources/auth_methods.dart';
import 'package:my_own_ebook/screens/auth/login_screen.dart';
import 'package:my_own_ebook/screens/auth/widget/auth_button.dart';
import 'package:my_own_ebook/screens/auth/widget/textfield_auth.dart';

import '../../utils/constants.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _addressTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  bool _obscureText = true;
  @override
  void dispose() {
    _fullNameController.dispose();
    _emailTextController.dispose();
    _passTextController.dispose();
    _addressTextController.dispose();
    _emailFocusNode.dispose();
    _passFocusNode.dispose();
    _addressFocusNode.dispose();
    super.dispose();
  }

  void _submitFormOnRegister() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.white.withOpacity(0.7),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const SizedBox(
                    height: 60.0,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => Navigator.canPop(context)
                        ? Navigator.pop(context)
                        : null,
                    child: Icon(
                      IconlyLight.arrowLeft2,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/logo marron.png',
                      height: 100,
                      width: 150,
                    ),
                  ),
                  Constants.meduimPaddingHor,
                  const Center(
                    child: Text(
                      'Welcome Back',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Constants.smallPaddingHor,
                  const Center(
                    child: Text(
                      'Sign Up to continue',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        MyTextField(
                          controller: _fullNameController,
                          hintText: "Full Name",
                          obscureText: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "This Field is missing";
                            } else {
                              return null;
                            }
                          },
                        ),
                        Constants.smallPaddingHor,
                        MyTextField(
                          controller: _emailTextController,
                          hintText: "Email",
                          obscureText: false,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains("@")) {
                              return "Please enter a valid Email adress";
                            } else {
                              return null;
                            }
                          },
                        ),
                        Constants.smallPaddingHor,
                        MyTextField(
                          controller: _passTextController,
                          hintText: "Password",
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return "Please enter a valid password";
                            } else {
                              return null;
                            }
                          },
                        ),

                        // TextFormField(
                        //   focusNode: _addressFocusNode,
                        //   textInputAction: TextInputAction.done,
                        //   onEditingComplete: _submitFormOnRegister,
                        //   controller: _addressTextController,
                        //   validator: (value) {
                        //     if (value!.isEmpty || value.length < 10) {
                        //       return "Please enter a valid  address";
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        //   style: const TextStyle(color: Colors.white),
                        //   maxLines: 2,
                        //   textAlign: TextAlign.start,
                        //   decoration: const InputDecoration(
                        //     hintText: 'Shipping address',
                        //     hintStyle: TextStyle(color: Colors.white),
                        //     enabledBorder: UnderlineInputBorder(
                        //       borderSide: BorderSide(color: Colors.white),
                        //     ),
                        //     focusedBorder: UnderlineInputBorder(
                        //       borderSide: BorderSide(color: Colors.white),
                        //     ),
                        //     errorBorder: UnderlineInputBorder(
                        //       borderSide: BorderSide(color: Colors.red),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Constants.meduimPaddingHor,
                  AuthButton(
                    buttonText: 'Sign up',
                    fct: () async {
                      String res = await AuthMethods().signUpUser(
                          email: _emailTextController.text,
                          password: _passTextController.text,
                          username: _fullNameController.text);

                      if (res == 'success') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: 'Already a user?',
                          style: const TextStyle(
                              color: Colors.orangeAccent, fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Sign in',
                                style: const TextStyle(
                                    color: Colors.orange, fontSize: 18),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                LoginScreen())));
                                  }),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
