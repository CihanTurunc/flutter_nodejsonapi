import 'package:flutter/material.dart';
import 'package:flutter_nodejsonapi/screens/main_screen.dart';

void main() {
  runApp(const HttpApp());
}

class HttpApp extends StatelessWidget {
  const HttpApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const MainScreen(),
    );
  }
}
