import 'package:flutter/material.dart';

import '../models/book.dart';

class WishlistProvider with ChangeNotifier {
  final List<Book> _listWishlist = [];

  List<Book> get wishlist => _listWishlist;

  void clearListCart() {
    _listWishlist.clear();
    notifyListeners();
  }

  void addBookToWishlist(Book book) {
    if (!_listWishlist.contains(book)) {
      _listWishlist.add(book);
    }

    notifyListeners();
  }

  void removeBookFromCart(Book book) {
    _listWishlist.remove(book);
    notifyListeners();
  }
}
