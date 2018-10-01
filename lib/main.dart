import 'package:flutter/material.dart';
import 'package:sat_showdown/login_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new LoginPage(),
      title: 'MyApp',
      debugShowCheckedModeBanner: false,
    );
  }
}
