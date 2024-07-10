import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  final Function(Meal meal) onToggleFavorite;
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: () {
            onToggleFavorite(meal);
          }, icon: Icon( Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14,),
            Text('Ingredients', style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),),
            const SizedBox(height: 14,),
            for (final ingredient in meal.ingredients)
              Text(ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
                ),
              ),
            const SizedBox(height: 14,),
            Text('Steps', style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),),
            const SizedBox(height: 14,),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(step,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                  ), textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 14,),
          ]
        ),
      ),
    );
  }
}
