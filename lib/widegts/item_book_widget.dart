import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:my_own_ebook/providers/cart_provider.dart';

import 'package:my_own_ebook/screens/Item_book_screen/item_book_screen.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../providers/wishlist_provider.dart';
import '../utils/constants.dart';

class ItemBookWidget extends StatelessWidget {
  final Book book;
  const ItemBookWidget({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFavorite = context.read<WishlistProvider>().wishlist.contains(book);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => ItemBookScreen(
                      book: book,
                    ))));
      },
      child: SizedBox(
        width: 220,
        child: Card(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (isFavorite) {
                            context
                                .read<WishlistProvider>()
                                .removeBookFromCart(book);
                          } else {
                            context
                                .read<WishlistProvider>()
                                .addBookToWishlist(book);
                          }
                        },
                        icon: const Icon(
                          IconlyBold.heart,
                          size: 36,
                        )),
                    IconButton(
                        onPressed: () {
                          context.read<CartProvider>().addBookToCart(book);
                        },
                        icon: const Icon(
                          IconlyBold.buy,
                          size: 36,
                        )),
                  ],
                ),
                Center(
                  child: Image.network(
                    book.urlImage,
                    width: 150,
                    height: 180,
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
                  maxLines: 2,
                  style: Constants.normalStyle
                      .copyWith(overflow: TextOverflow.ellipsis),
                ),
                Text(
                  book.category,
                  maxLines: 1,
                  style: Constants.normalStyle
                      .copyWith(overflow: TextOverflow.ellipsis),
                ),
                Text(
                  book.auther,
                  maxLines: 2,
                  style: Constants.smallStyle
                      .copyWith(overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
