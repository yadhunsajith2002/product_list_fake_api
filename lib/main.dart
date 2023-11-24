import 'package:fake_store_api/controller/home_controller.dart';
import 'package:fake_store_api/view/home_screen/home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeController(),
      child: MaterialApp(
          title: 'Flutter Demo', theme: ThemeData.light(), home: HomeScreen()),
    );
  }
}
