import 'package:flutter/material.dart';

import 'widgets/widget_category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listData = [
      {
        'color': const Color(0xff53B175),
        "nameCategory": "Bien-être & vie pratique",
      },
      {
        'color': const Color(0xffF8A44C),
        "nameCategory": "Sciences humaines et sociales",
      },
      {
        'color': const Color(0xffF7A593),
        "nameCategory": "Romans",
      },
      {
        'color': const Color(0xffD3B0E0),
        "nameCategory": "Arts & beaux livres",
      },
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 250 / 420,
            crossAxisSpacing: 20, // Vertical spacing
            mainAxisSpacing: 20, // Horizontal spacing
            children: List.generate(4, (index) {
              return WidgetCategory(
                  categoryText: listData[index]['nameCategory'],
                  color: listData[index]['color']);
            }),
          ),
        ));
  }
}
