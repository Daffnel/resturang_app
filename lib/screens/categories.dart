import 'package:flutter/material.dart';
import 'package:resturang_app/data/dummy_data.dart';
import 'package:resturang_app/models/category.dart';
import 'package:resturang_app/screens/meals.dart';
import 'package:resturang_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filterdMeals = dummyMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: filterdMeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // for (final category in availableCategories) CategoryGridItem(category: category),
        ...availableCategories.map(
          (item) => CategoryGridItem(
            category: item,
            onSelectCategory: () {
              _selectCategory(context, item);
            },
          ),
        ),
      ],
    );
  }
}
