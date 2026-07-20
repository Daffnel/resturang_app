import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({required this.currentFilters, super.key});

  final Map<Filter, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterSet = false;
  var _lactosFreeFilterSet = false;
  var _veganFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;

  @override
  void initState() {
    super.initState();

    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactosFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _veganFreeFilterSet = widget.currentFilters[Filter.vegan]!;
    _vegetarianFreeFilterSet = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*    drawer: MainDrawer(
        onSelectScreen: (identifier) {
          Navigator.of(context).pop();
          if (identifier == 'meals') {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const TabsScreen(),
              ),
            );
          }
        },
      ) ,*/
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.of(context).pop(
            //av rtypen MAP Map<Enum, bool>
            {
              Filter.glutenFree: _glutenFreeFilterSet,
              Filter.lactoseFree: _lactosFreeFilterSet,
              Filter.vegan: _veganFreeFilterSet,
              Filter.vegetarian: _vegetarianFreeFilterSet,
            },
          );
        },
        child: Column(
          children: [
            SwitchListTile(
              title: Text(
                'Gluten-free',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
            ),

            SwitchListTile(
              title: Text(
                'Lactose-free',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include lactose-free meals',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              value: _lactosFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactosFreeFilterSet = isChecked;
                });
              },
            ),

            SwitchListTile(
              title: Text(
                'Vegan',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              value: _veganFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFilterSet = isChecked;
                });
              },
            ),

            SwitchListTile(
              title: Text(
                'Vegetarian',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include vegetarian meals',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              value: _vegetarianFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFreeFilterSet = isChecked;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
