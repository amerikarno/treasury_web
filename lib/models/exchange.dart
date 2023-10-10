import 'package:flutter/material.dart';

class Exchange {
  const Exchange({
    required this.exch,
    required this.currency,
    required this.buying,
    required this.selling,
    required this.description,
    this.color = Colors.yellow,
  });

  final String exch;
  final String currency;
  final String buying;
  final String selling;
  final String description;
  final Color color;
}