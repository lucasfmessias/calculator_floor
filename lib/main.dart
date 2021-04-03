import 'pages/calculator_page.dart';
import 'core/constants.dart';
import 'core/theme_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false, // remove debug flag
      title: kAppTitle,
      theme: kAppTheme,
      home: CalculatorPage(),
    );
  }
}
