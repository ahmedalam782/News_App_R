import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String imageName;
  final String title;
  final Color color;

  CategoryModel({
    required this.id,
    required this.title,
    required this.imageName,
    required this.color,
  });
}
