import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:treasury_web/models/category.dart';
// import 'package:treasury_web/models/exchange.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    log(category.id);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          category.color.withOpacity(0.55),
          category.color.withOpacity(0.9),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),

      child: Column(children: [
        Text(
          category.id,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        Text(

          'body: ${category.body}',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ]),
      // child: Text(
      //   category.title,
      //   style: Theme.of(context).textTheme.titleLarge!.copyWith(
      //         color: Theme.of(context).colorScheme.onBackground,
      //       ),

      // ),
    );
  }
}
