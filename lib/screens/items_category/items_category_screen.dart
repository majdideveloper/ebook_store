import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/product_provider.dart';
import '../../widegts/item_book_widget.dart';

class ItemsCategory extends StatelessWidget {
  final String nameCategory;
  const ItemsCategory({
    Key? key,
    required this.nameCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nameCategory)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<ProductProvider>(
            builder: (context, data, child) => GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.booksCategory(nameCategory).length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,

                // width / height: fixed for *all* items
                childAspectRatio: 0.45,
              ),
              itemBuilder: (context, index) {
                return ItemBookWidget(
                  book: data.booksCategory(nameCategory)[index],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
