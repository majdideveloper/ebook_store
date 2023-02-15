import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  final String title;
  final String auther;
  final String urlImage;
  final String category;
  final double price;
  final bool onSale;
  double? priceOnSale;
  Book({
    required this.title,
    required this.auther,
    required this.urlImage,
    required this.category,
    required this.price,
    required this.onSale,
    this.priceOnSale,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'auther': auther,
      'urlImage': urlImage,
      'category': category,
      'price': price,
      'onSale': onSale,
      'priceOnSale': priceOnSale,
    };
  }

  static Book fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Book(
        title: snapshot["title"],
        auther: snapshot["auther"],
        price: snapshot["price"],
        urlImage: snapshot["urlImage"],
        category: snapshot["category"],
        onSale: snapshot["onSale"],
        priceOnSale: snapshot['priceOnsale']);
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      title: map['title'] ?? '',
      auther: map['auther'] ?? '',
      urlImage: map['urlImage'] ?? '',
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      onSale: map['onSale'] ?? false,
      priceOnSale: map['priceOnSale']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'auther': auther,
        'urlImage': urlImage,
        'category': category,
        'price': price,
        'onSale': onSale,
        'priceOnSale': priceOnSale,
      };
}
