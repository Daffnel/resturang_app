import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:resturang_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category, required this.onSelectCategory});

  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      onTap: onSelectCategory,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withAlpha(60),
              category.color.withAlpha(225),
            ],
            begin: AlignmentGeometry.topStart,
            end: AlignmentGeometry.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
