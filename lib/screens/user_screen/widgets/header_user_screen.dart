import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class HeaderUserScreen extends StatelessWidget {
  final String name;
  final String email;
  const HeaderUserScreen({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: TextSpan(
              text: 'Hey, '.toUpperCase(),
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              children: [
                TextSpan(
                  text: name.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          Constants.smallPaddingHor,
          Text(
            email,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
