import 'package:flutter/material.dart';
import 'package:resturang_app/models/meal.dart';

class MealsDetailsScreen extends StatelessWidget {
  MealsDetailsScreen({required this.meal, super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Column(
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
            style: Theme.of(context).textTheme.titleLarge!.copyWith(),
          ),
        ],
      ),
    );
  }
}
