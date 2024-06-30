import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:month4_lesson3_homework/controllers/cart_controller.dart';
import 'package:month4_lesson3_homework/controllers/order_controller.dart';
import 'package:month4_lesson3_homework/controllers/product_controller.dart';
import 'package:month4_lesson3_homework/screens/views/home_screen.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ProductController(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CartController(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => OrderController(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
