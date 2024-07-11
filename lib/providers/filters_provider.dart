import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/filter.dart';

enum Filter {
  gultenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier() : super({
    Filter.gultenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  });

  void setFilters(Map<Filter, bool> chosenFilter) {
    state = chosenFilter;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive
    };
  }
}
final filterProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier()
);


final filteredMealsprovider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilter = ref.watch(filterProvider);

  return meals.where((meal) {
    if (activeFilter[Filter.gultenFree]! && !meal.isGlutenFree) {
      return false;
    }

    if (activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }

    if (activeFilter[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }

    if (activeFilter[Filter.vegan]! && !meal.isVegan) {
      return false;
    }

    return true;
  }).toList();
});