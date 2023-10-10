import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.body = '',
    this.color = Colors.orange,
  });

  final String id;
  final String title;
  final String body;
  final Color color;
}