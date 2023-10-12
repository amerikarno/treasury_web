import 'package:flutter/material.dart';

class Exchange {
  const Exchange({
    required this.exch,
    required this.currency,
    required this.buying,
    required this.buyDirection,
    required this.selling,
    required this.sellDirection,
    required this.description,
    required this.updateTime,
    this.color = Colors.yellow,
  });

  final String exch;
  final String currency;
  final String buying;
  final String buyDirection;
  final String selling;
  final String sellDirection;
  final String description;
  final String updateTime;
  final Color color;
}