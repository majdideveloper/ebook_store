import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String title;
  String? subtitle;
  Widget? leading;
  Widget? trailing;
  void Function()? onTap;

  MyListTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          : null,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
