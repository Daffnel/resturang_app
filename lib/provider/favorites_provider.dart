import 'package:flutter_riverpod/legacy.dart';
import 'package:resturang_app/models/meal.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]);

  void toogleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((item) => item.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favoritesMeal = StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>((ref) {
  return FavoritesMealsNotifier();
});
