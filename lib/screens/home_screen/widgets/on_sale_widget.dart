import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_own_ebook/providers/product_provider.dart';
import 'package:my_own_ebook/screens/on_sale_screen/on_sale_screen.dart';
import 'package:my_own_ebook/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../widegts/item_book_widget.dart';

class OnSaleWidget extends StatelessWidget {
  const OnSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const RotatedBox(
          quarterTurns: 3,
          child: Text(
            'On Sale',
            style: TextStyle(
                color: Colors.red,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 10,
                height: 1.5),
          ),
        ),
        Constants.smallPaddingVer,
        Consumer<ProductProvider>(
          builder: (context, data, child) => Flexible(
            child: SizedBox(
              height: 500,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.getOnSaleProducts.length > 5
                      ? 5
                      : data.getOnSaleProducts.length,
                  itemBuilder: ((context, index) {
                    return ItemBookWidget(
                      book: data.getOnSaleProducts[index],
                    );
                  })),
            ),
          ),
        ),
      ],
    );
  }
}
