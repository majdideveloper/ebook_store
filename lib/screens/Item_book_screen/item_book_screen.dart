import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:my_own_ebook/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../models/book.dart';
import '../../utils/constants.dart';

class ItemBookScreen extends StatelessWidget {
  final Book book;
  const ItemBookScreen({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isOnSale = true;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 36,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        IconlyBold.heart,
                        size: 36,
                      )),
                ],
              ),
              Center(
                child: Image.network(
                  book.urlImage,
                  width: 150,
                  height: 280,
                ),
              ),
              Constants.smallPaddingHor,
              Row(
                children: [
                  book.onSale
                      ? Text(
                          book.price.toString(),
                          style: Constants.normalStyle.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        )
                      : Text(
                          book.price.toString(),
                          style: Constants.titleStyleBold,
                        ),
                  Spacer(),
                  Visibility(
                    visible: book.onSale,
                    child: Text(
                      book.priceOnSale.toString(),
                      style: Constants.titleStyleBold,
                    ),
                  )
                ],
              ),
              Text(
                book.title,
                maxLines: 3,
                style: Constants.titleStyle
                    .copyWith(overflow: TextOverflow.ellipsis),
              ),
              Text(
                book.category,
                maxLines: 2,
                style: Constants.normalStyle
                    .copyWith(overflow: TextOverflow.ellipsis),
              ),
              Text(
                book.auther,
                maxLines: 2,
                style: Constants.smallStyle
                    .copyWith(overflow: TextOverflow.ellipsis),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<CartProvider>().addBookToCart(book);
                  },
                  child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Center(
                          child: Text(
                        'Add to cart',
                        style: Constants.normalStyleBold,
                      )))),
            ],
          ),
        ),
      ),
    );
  }
}
