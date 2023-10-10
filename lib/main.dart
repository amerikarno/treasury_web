import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:treasury_web/widgets/exchange_grit_item.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          // useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 147, 229, 250),
            brightness: Brightness.dark,
            surface: const Color.fromARGB(255, 42, 51, 59),
          )),
      home: const ExchangeGridItem(),
    );
  }
}
