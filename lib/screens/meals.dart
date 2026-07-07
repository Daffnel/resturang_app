import 'package:flutter/material.dart';
import 'package:resturang_app/models/meal.dart';
import 'package:resturang_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({required this.title, required this.meals, super.key});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: meals.isNotEmpty
          ? ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx, index) => MealItem(meal: meals[index]),
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Uh oh ... nothing here',
                    style:
                        Theme.of(
                          context,
                        ).textTheme.headlineLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Try an diffrent category",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),
                  ),
                ],
              ),
            ),
    );
  }
}
