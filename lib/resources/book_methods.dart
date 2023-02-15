import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_own_ebook/models/book.dart';

class BookMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  addBook(String title, String auther, String urlImage, String category,
      double price, bool onSale,
      {double? priceOnSale}) async {
    try {
      Book _book = Book(
          title: title,
          auther: auther,
          urlImage: urlImage,
          category: category,
          price: price,
          onSale: onSale,
          priceOnSale: priceOnSale);

      // adding user in our database
      await _firestore.collection("books").doc(title).set(_book.toJson());
      print('okkkk');
    } catch (e) {
      print(e);
    }
  }
}
