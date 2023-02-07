import 'package:flutter/material.dart';

import '../models/book.dart';

class CartProvider with ChangeNotifier {
  final List<Book> _listCart = [];

  List<Book> get listCart => _listCart;

  void clearListCart() {
    _listCart.clear();
    notifyListeners();
  }

  void addBookToCart(Book book) {
    if (!_listCart.contains(book)) {
      _listCart.add(book);
    }

    notifyListeners();
  }

  void removeBookFromCart(Book book) {
    _listCart.remove(book);
    notifyListeners();
  }
}
