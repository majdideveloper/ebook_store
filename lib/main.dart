import 'package:flutter/material.dart';
import 'package:my_own_ebook/providers/cart_provider.dart';
import 'package:my_own_ebook/providers/product_provider.dart';
import 'package:my_own_ebook/providers/wishlist_provider.dart';
import 'package:my_own_ebook/screens/auth/login_screen.dart';
import 'package:my_own_ebook/screens/bottom_bar/bottom_bar.dart';
import 'package:my_own_ebook/screens/home_screen/home_screen.dart';
import 'package:my_own_ebook/utils/theme/theme_data.dart';
import 'package:provider/provider.dart';

import 'providers/app_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return AppProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return ProductProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return CartProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return WishlistProvider();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: Styles.themeData(false, context),
        home: const LoginScreen(),
      ),
    );
  }
}
