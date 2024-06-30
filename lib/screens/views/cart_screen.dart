import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:month4_lesson3_homework/controllers/cart_controller.dart';
import 'package:month4_lesson3_homework/controllers/order_controller.dart';
import 'package:month4_lesson3_homework/models/order.dart';
import 'package:month4_lesson3_homework/models/product.dart';
import 'package:month4_lesson3_homework/screens/widgets/product_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

    Order order = Order(
      id: UniqueKey().toString(),
      products:  [],
      dateTime: DateTime.now(),
    );


  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    final orderController = Provider.of<OrderController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: cartController.cart.products.isEmpty ?
      Center(
        child: Text("Cart is empty!"),
      ) : ListView.builder(
        itemCount: cartController.cart.products.length,
          itemBuilder: (ctx, index){
            final product = cartController.cart.products.values.toList()[index]['product'];
            order.products.add(product);
            return ChangeNotifierProvider<Product>.value(
              value: product,
              builder: (context, child){
                return ProducItem();
              },
            );
          })
    );
  }
}
