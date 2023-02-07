import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_own_ebook/utils/constants.dart';

import '../../items_category/items_category_screen.dart';

class WidgetCategory extends StatelessWidget {
  final Color color;
  final String categoryText;

  const WidgetCategory({
    Key? key,
    required this.color,
    required this.categoryText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ItemsCategory(
                      nameCategory: categoryText,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withOpacity(0.7),
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            categoryText,
            textAlign: TextAlign.center,
            style: Constants.titleStyle,
          ),
        ),
      ),
    );
  }
}
