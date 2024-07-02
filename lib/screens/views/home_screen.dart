import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:month4_lesson3_homework/controllers/product_controller.dart';
import 'package:month4_lesson3_homework/models/product.dart';
import 'package:month4_lesson3_homework/screens/views/cart_screen.dart';
import 'package:month4_lesson3_homework/screens/views/order_screen.dart';
import 'package:month4_lesson3_homework/screens/widgets/manage_product.dart';
import 'package:month4_lesson3_homework/screens/widgets/product_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController =
        Provider.of<ProductController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog"),
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       CupertinoPageRoute(
        //           builder: (BuildContext context) => OrderScreen()),
        //     );
        //   },
        //   icon: Icon(Icons.ac_unit),
        // ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => ManageProduct(isEdit: false),
              );
            },
            icon: Icon(Icons.add_circle),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 8.0,
            ),
            child: IconButton(
              onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => CartScreen()),
              ),
              icon: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: productController.products.length,
        itemBuilder: (BuildContext context, int index) =>
            ChangeNotifierProvider<Product>.value(
          value: productController.products[index],
          builder: (BuildContext context, Widget? child) => ProducItem(),
        ),
      ),
    );
  }
}
