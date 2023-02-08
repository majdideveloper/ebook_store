import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:my_own_ebook/providers/app_provider.dart';
import 'package:my_own_ebook/resources/auth_methods.dart';
import 'package:my_own_ebook/screens/auth/login_screen.dart';
import 'package:my_own_ebook/screens/user_screen/widgets/header_user_screen.dart';
import 'package:my_own_ebook/screens/user_screen/widgets/my_list_tile.dart';
import 'package:provider/provider.dart';

import 'package:my_own_ebook/models/user.dart' as model;
import '../../providers/user_provider.dart';
import '../../utils/show_dialog/show_dialog.dart';
import '../wishlist_screen/wishlist_screen.dart';

class UserScreen extends StatefulWidget {
  UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderUserScreen(
            name: context.watch<UserProvider>().getUser.username,
            email: context.watch<UserProvider>().getUser.email,
          ),
          const Divider(
            thickness: 2,
          ),
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
            title: "Logout",
            leading: const Icon(IconlyLight.logout),
            trailing: const Icon(IconlyLight.arrowRight2),
            onTap: () async {
              await showDialogConfirmation(
                  context: context,
                  title: "Sign out",
                  content: "are you sure to Sign Out",
                  onPressedOkButton: () async {
                    await AuthMethods().signOut();
                    context.read<AppProvider>().setCurrentIndex = 0;
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
