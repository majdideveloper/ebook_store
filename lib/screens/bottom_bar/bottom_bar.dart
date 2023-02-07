import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:my_own_ebook/providers/app_provider.dart';
import 'package:my_own_ebook/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

import '../cart_screen/cart_screen.dart';
import '../categories_screen/categories_screen.dart';
import '../user_screen/user_screen.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> listScreen = [
      HomeScreen(),
      CategoriesScreen(),
      CartScreen(),
      UserScreen(),
    ];
    var provider = context.read<AppProvider>();
    var providerListen = context.watch<AppProvider>();

    final ProviderApp = Provider.of<AppProvider>(context);
    int _indexSelected = ProviderApp.getCurrentIndex;
    return Scaffold(
      body: listScreen[ProviderApp.getCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ProviderApp.getCurrentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: ((value) {
          ProviderApp.setCurrentIndex = value;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                  _indexSelected == 0 ? IconlyBold.home : IconlyLight.home),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(_indexSelected == 1
                  ? IconlyBold.category
                  : IconlyLight.category),
              label: ''),
          BottomNavigationBarItem(
              icon:
                  Icon(_indexSelected == 2 ? IconlyBold.buy : IconlyLight.buy),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                  _indexSelected == 3 ? IconlyBold.user2 : IconlyLight.user2),
              label: ''),
        ],
      ),
    );
  }
}
