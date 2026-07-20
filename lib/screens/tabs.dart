import 'package:flutter/material.dart';
import 'package:resturang_app/data/dummy_data.dart';
import 'package:resturang_app/models/meal.dart';
import 'package:resturang_app/screens/categories.dart';
import 'package:resturang_app/screens/filters.dart';
import 'package:resturang_app/screens/meals.dart';
import 'package:resturang_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favortitesMeal = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toogleMealFavoriteStatus(Meal meal) {
    final isExisting = _favortitesMeal.contains(meal);

    if (isExisting) {
      setState(() {
        _favortitesMeal.remove(meal);
        _showInfoMessage("${meal.title} added to favorites..");
        debugPrint(meal.title);
      });
    } else {
      setState(() {
        _favortitesMeal.add(meal);
        _showInfoMessage("${meal.title} removed favorites..");
        debugPrint(meal.title);
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();

    if (identifier == 'filter') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctxt) => FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      availableMeals: dummyMeals,
      onToggleFavorite: _toogleMealFavoriteStatus,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        onToogleFavorites: _toogleMealFavoriteStatus,
        meals: _favortitesMeal,
      );
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      drawer: MainDrawer(onSelectScreen: _setScreen),
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
