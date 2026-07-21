import 'package:flutter/material.dart';
import 'package:resturang_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resturang_app/provider/favorites_provider.dart';

class MealsDetailsScreen extends ConsumerWidget {
  const MealsDetailsScreen({required this.meal, super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final result = ref
                  .read(favoritesMealProvider.notifier)
                  .toogleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    result
                        ? "${meal.title} is added to favorites"
                        : " ${meal.title} is removed from favorite",
                  ),
                ),
              );
            },
            icon: const Icon(Icons.star),
          ),
        ],
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              image: NetworkImage(meal.imageUrl),
            ),
            SizedBox(height: 14),
            Text(
              'Ingredients',
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(height: 14),
            // ...meal.ingredients.map((item) => Text(item)),
            for (final item in meal.ingredients)
              Text(
                item,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            SizedBox(height: 14),
            Text(
              'Steps',
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(
              height: 14,
            ),
            ...meal.steps.map(
              (steps) => Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(
                  steps,
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
