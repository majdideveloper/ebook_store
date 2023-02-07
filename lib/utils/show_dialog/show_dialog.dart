import 'package:flutter/material.dart';

Future<void> showAddressDialog(
    BuildContext context, TextEditingController controller) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update'),
          content: TextField(
            // onChanged: (value) {
            //   print('_addressTextController.text ${_addressTextController.text}');
            // },
            controller: controller,
            maxLines: 5,
            decoration: const InputDecoration(hintText: "Your address"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                print(
                  controller.text,
                );
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
          ],
        );
      });
}

Future<void> showDialogConfirmation({
  required BuildContext context,
  required String title,
  required String content,
  required void Function()? onPressedOkButton,
}) async {
  await showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: onPressedOkButton,
              child: const Text('ok'),
            ),
          ],
        );
      }));
}
