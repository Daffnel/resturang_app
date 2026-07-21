import 'package:flutter/material.dart';
import 'package:resturang_app/provider/filters_provider.dart';
import 'package:resturang_app/models/meal.dart';
import 'package:resturang_app/screens/categories.dart';
import 'package:resturang_app/screens/filters.dart';
import 'package:resturang_app/screens/meals.dart';
import 'package:resturang_app/widgets/main_drawer.dart';
import 'package:resturang_app/provider/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resturang_app/provider/favorites_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  Map<Filter, bool> _selectedFilters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegan: false,
    Filter.vegetarian: false,
  };

  /*   void _toogleMealFavoriteStatus(Meal meal) {
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
  } */

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == 'filter') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctxt) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filterProvider);
    final favoriteMeal = ref.watch(favoritesMealProvider);

    final availableMeals = meals.where((meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }

      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }

      if (activeFilters[Filter.vegan]! && !meal.isVegetarian) {
        return false;
      }

      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }

      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: favoriteMeal,
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
