import 'package:flutter/material.dart';
import 'package:my_own_ebook/utils/constants.dart';

import '../models/book.dart';

class ProductProvider with ChangeNotifier {
  final List<Book> _listProducts = Constants.listBook;

  List<Book> get listProducts => _listProducts;

  List<Book> get getOnSaleProducts =>
      _listProducts.where((element) => element.onSale == true).toList();

  List<Book> booksCategory(String category) {
    return _listProducts
        .where((element) => element.category == category)
        .toList();
  }
}
