import 'package:flutter/material.dart';
import 'package:resturang_app/data/dummy_data.dart';
import 'package:resturang_app/models/meal.dart';
import 'package:resturang_app/screens/categories.dart';
import 'package:resturang_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favortitesMeal = [];

  void _toogleMealFavoriteStatus(Meal meal) {
    final isExisting = _favortitesMeal.contains(meal);

    if (isExisting) {
      _favortitesMeal.remove(meal);
    } else {
      _favortitesMeal.add(meal);
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      availableMeals: dummyMeals,
      onToggleFavorite: _toogleMealFavoriteStatus,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(onToogleFavorites: _toogleMealFavoriteStatus, meals: []);
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
      body: activePage,
      appBar: AppBar(title: Text(activePageTitle)),
    );
  }
}
