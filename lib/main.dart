import 'package:base_app/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.amber,
        primaryColor:
            Color(int.parse("FF9C04".substring(0, 6), radix: 16) + 0xFF000000),
      ),
      onGenerateRoute: Routes.routes(),
    );
  }
}
