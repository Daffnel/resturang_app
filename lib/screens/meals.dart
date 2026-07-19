import 'package:flutter/material.dart';
import 'package:resturang_app/models/meal.dart';
import 'package:resturang_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({this.title, required this.onToogleFavorites, required this.meals, super.key});

  final String? title;
  final List<Meal> meals;

  final void Function(Meal meal) onToogleFavorites;

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Text('Uh oh ... nothing here'),

            const SizedBox(height: 16),

            Text('Try a different category'),
          ],
        ),
      );
    } else {
      content = ListView.builder(
        itemCount: meals.length,

        itemBuilder: (ctx, index) =>
            MealItem(onToogleFavorites: onToogleFavorites, meal: meals[index]),
      );
    }

    return Scaffold(
      appBar: title == null ? null : AppBar(title: Text(title!)),

      body: content,
    );
  }
}
