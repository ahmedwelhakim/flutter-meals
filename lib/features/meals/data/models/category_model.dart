import 'package:flutter/material.dart';
import 'package:meals_app/features/meals/domain/entities/category_entity.dart';

class CategoryModel {
  final String id;
  final String title;
  final Color color;

  const CategoryModel({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      title: title,
      color: color,
    );
  }
}
