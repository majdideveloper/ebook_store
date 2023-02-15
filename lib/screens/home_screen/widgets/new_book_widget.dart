import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_own_ebook/models/book.dart';
import 'package:my_own_ebook/providers/product_provider.dart';
import 'package:my_own_ebook/screens/on_sale_screen/on_sale_screen.dart';
import 'package:my_own_ebook/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../widegts/item_book_widget.dart';

class NewBooksWidget extends StatelessWidget {
  const NewBooksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('books').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: 500,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                  return ItemBookWidget(
                    book: Book.fromSnap(documentSnapshot),
                  );
                },
              ),
            );
          }
          ;
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
