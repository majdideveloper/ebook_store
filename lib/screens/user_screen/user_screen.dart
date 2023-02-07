import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:my_own_ebook/screens/auth/login_screen.dart';
import 'package:my_own_ebook/screens/user_screen/widgets/header_user_screen.dart';
import 'package:my_own_ebook/screens/user_screen/widgets/my_list_tile.dart';
import 'package:provider/provider.dart';

import '../../utils/show_dialog/show_dialog.dart';
import '../wishlist_screen/wishlist_screen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderUserScreen(
            name: "youssef",
            email: "youssef@email.com",
          ),

          const Divider(
            thickness: 2,
          ),

          // MyListTile(
          //   title: "Address",
          //   subtitle: "My Address 2",
          //   leading: const Icon(IconlyLight.profile),
          //   trailing: const Icon(IconlyLight.arrowRight2),
          //   onTap: () => showAddressDialog(context, controller),
          // ),

          MyListTile(
            title: "Wishlist",
            leading: const Icon(IconlyLight.heart),
            trailing: const Icon(IconlyLight.arrowRight2),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => WishlistScreen())));
            },
          ),

          MyListTile(
            title: "Forget Password",
            leading: const Icon(IconlyLight.unlock),
            trailing: const Icon(IconlyLight.arrowRight2),
          ),
          // theme

          MyListTile(
            title: "Logout",
            leading: const Icon(IconlyLight.logout),
            trailing: const Icon(IconlyLight.arrowRight2),
            onTap: () async {
              await showDialogConfirmation(
                  context: context,
                  title: "Sign out",
                  content: "are you sure to Sign Out",
                  onPressedOkButton: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false);
                  });
            },
          ),
        ],
      ),
    );
  }
}
