import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../providers/product_provider.dart';
import '../../widegts/item_book_widget.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Products')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<ProductProvider>(
            builder: (context, data, child) => GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.listProducts.length,
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
        ),
      ),
    );
  }
}
