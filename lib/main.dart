import 'package:flutter/material.dart';
import 'package:news/layout/home.dart';
import 'package:news/provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<AppProvider>(
    create: (context) => AppProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (c) => HomeScreen(),
      },
    );
  }
}
