import 'package:flutter/material.dart';
import 'package:month4_lesson3_homework/controllers/order_controller.dart';
import 'package:month4_lesson3_homework/models/order.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderController orderController = Provider.of<OrderController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: ListView.builder(
          itemCount: orderController.orders.length,
          itemBuilder: (context, index){
            Order order = orderController.orders[index];
            return Container(
              width: double.infinity,
              margin: EdgeInsets.all(15),
              color: Colors.yellow,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(order.id),
                      Text(order.dateTime.toString()),
                    ],
                  ),
                  Column(
                    children: List.generate(
                        order.products.length,
                        (index) => Column(
                          children: [
                            Text(order.products[index].text),
                            Text(order.products[index].price.toString()),
                          ],
                        )),
                  )
                ],
              ),
            );
          }),
    );
  }
}
