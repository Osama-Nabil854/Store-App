import 'package:flutter/material.dart';
import 'package:store/Screens/home_page.dart';
import 'package:store/Screens/update_product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: 'homepage',
      routes: {
        'homepage': (context) => const HomePage(),
        'updateProduct': (context) => const UpdateProductPage(),
      },
    );
  }
}
