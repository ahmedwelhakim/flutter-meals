import 'package:flutter/material.dart';

import '../../models/category_model.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;
  final void Function(Category category) onSelectCategory;

  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectCategory(category);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
