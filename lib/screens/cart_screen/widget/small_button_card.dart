import 'package:flutter/material.dart';

class SmallButtonCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  void Function()? onTap;
  SmallButtonCard({
    Key? key,
    required this.color,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 8.0,
      borderRadius: BorderRadius.circular(8.0),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 35,
          width: 35,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
