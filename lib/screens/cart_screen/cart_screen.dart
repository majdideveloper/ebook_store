import 'package:flutter/material.dart';
import 'package:my_own_ebook/providers/cart_provider.dart';

import 'package:my_own_ebook/screens/cart_screen/widget/cart_item_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, data, child) => Scaffold(
        appBar: AppBar(
          title: Text('Cart(${data.listCart.length})'),
          actions: [
            IconButton(
                onPressed: () async {
                  context.read<CartProvider>().clearListCart();
                  // await showDialogConfirmation(
                  //     context: context,
                  //     title: "Clear Cart",
                  //     content: "are you sure to Clear your Cart",
                  //     onPressedOkButton: () {});
                },
                icon: const Icon(Icons.delete)),
          ],
        ),
        body: Center(
          child: SizedBox(
            width: 500,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Material(
                          color: Colors.green,
                          elevation: 6.0,
                          borderRadius: BorderRadius.circular(8.0),
                          child: InkWell(
                            onTap: () {},
                            child: const SizedBox(
                                height: 50,
                                width: 100,
                                child: Center(
                                    child: Text(
                                  'Order Now',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: ListView.builder(
                    itemCount: data.listCart.length,
                    //  physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                        book: data.listCart[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
