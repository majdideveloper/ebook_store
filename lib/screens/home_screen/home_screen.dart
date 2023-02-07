import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_own_ebook/providers/product_provider.dart';
import 'package:my_own_ebook/screens/home_screen/widgets/on_sale_widget.dart';
import 'package:my_own_ebook/screens/home_screen/widgets/slider_home.dart';
import 'package:my_own_ebook/widegts/item_book_widget.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import '../all_products_screen/all_products_screen.dart';
import '../on_sale_screen/on_sale_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            SliderHome(),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OnSaleScreen()));
                },
                child: Text(
                  'View All',
                  style: Constants.smallStyle,
                ),
              ),
            ),
            OnSaleWidget(),
            Constants.smallPaddingHor,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Product',
                    style: Constants.titleStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, OnSaleScreen.routeName);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllProductsScreen()));
                    },
                    child: Text(
                      'View All',
                      style: Constants.smallStyle,
                    ),
                  ),
                ],
              ),
            ),
            Consumer<ProductProvider>(
              builder: (_, data, __) => GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:
                    data.listProducts.length > 6 ? 6 : data.listProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  // width / height: fixed for *all* items
                  childAspectRatio: 0.45,
                ),
                itemBuilder: (context, index) {
                  return ItemBookWidget(
                    book: data.listProducts[index],
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
