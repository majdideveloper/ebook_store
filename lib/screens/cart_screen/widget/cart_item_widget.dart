import 'package:flutter/material.dart';
import 'package:my_own_ebook/providers/cart_provider.dart';

import 'package:my_own_ebook/screens/cart_screen/widget/small_button_card.dart';
import 'package:provider/provider.dart';

import '../../../models/book.dart';

class CartItemWidget extends StatefulWidget {
  final Book book;
  int quantity = 1;

  CartItemWidget({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    double priceBook;
    if (widget.book.priceOnSale == null) {
      priceBook = widget.book.price;
    } else {
      priceBook = widget.book.priceOnSale!;
    }

    double priceQuantity = quantity * priceBook;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.network(
                      widget.book.urlImage,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        widget.book.title,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SmallButtonCard(
                            color: Colors.red,
                            icon: Icons.minimize_sharp,
                            onTap: () {
                              setState(() {
                                if (quantity > 1) {
                                  quantity--;
                                  //priceQuantity = quantity * priceBook;
                                } else if (quantity == 1)
                                  context
                                      .read<CartProvider>()
                                      .removeBookFromCart(widget.book);
                              });
                            },
                          ),
                          Text(
                            quantity.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SmallButtonCard(
                            color: Colors.green,
                            icon: Icons.add,
                            onTap: () {
                              setState(() {
                                quantity++;
                                // priceQuantity = quantity * priceBook;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    //widget.book.price.toString(),
                    priceQuantity.toString(),
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
