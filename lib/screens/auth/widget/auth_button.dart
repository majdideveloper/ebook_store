import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.fct,
    required this.buttonText,
    this.primary = Colors.white38,
  }) : super(key: key);
  final Function()? fct;
  final String buttonText;
  final Color primary;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      child: InkWell(
        onTap: fct,
        child: Container(
          color: Colors.orange,
          height: 50,
          width: double.infinity,
          child: Center(
              child: Text(
            buttonText,
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
    // SizedBox(
    //   width: double.infinity,
    //   child: ElevatedButton(
    //       style: ElevatedButton.styleFrom(
    //         primary: primary, // background (button) color
    //       ),
    //       onPressed: () {
    //         fct();
    //         // _submitFormOnLogin();
    //       },
    //       child: Text(
    //         buttonText,
    //         style: const TextStyle(
    //           fontSize: 18,
    //           color: Colors.white,
    //         ),
    //       )),
    // );
  }
}
