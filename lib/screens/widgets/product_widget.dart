import 'package:flutter/material.dart';
import 'package:month4_lesson3_homework/controllers/cart_controller.dart';
import 'package:month4_lesson3_homework/controllers/product_controller.dart';
import 'package:month4_lesson3_homework/models/product.dart';
import 'package:month4_lesson3_homework/screens/widgets/manage_product.dart';
import 'package:provider/provider.dart';

class ProducItem extends StatelessWidget {
  const ProducItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: product.color,
      ),
      title: Text(
        product.text,
        style: const TextStyle(fontSize: 18, color: Colors.black),
      ),
      subtitle: Text(
        '\$${product.price}',
        style: TextStyle(fontWeight: FontWeight.bold, color: product.color),
      ),
      trailing: Consumer<CartController>(
        builder:
            (BuildContext context, CartController controller, Widget? child) {
          return controller.isInCart(product.id)
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.removeFromCart(product.id);
                      },
                      icon: const Icon(Icons.remove_circle),
                    ),
                    Text(
                      controller.getProductAmount(product.id).toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.addToCart(product);
                      },
                      icon: const Icon(Icons.add_circle),
                    ),
                    editWidget(context, product),
                    deleteWidget(context, product.id),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => controller.addToCart(product),
                      icon: const Icon(Icons.add),
                    ),
                    editWidget(context, product),
                    deleteWidget(context, product.id),
                  ],
                );
        },
      ),
    );
  }
}

Widget editWidget(BuildContext context, Product product) => IconButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (context) => ManageProduct(
          isEdit: true,
          product: product,
        ),
      );
    },
    icon: const Icon(Icons.edit));

Widget deleteWidget(BuildContext context, String productId) {
  return Consumer<ProductController>(
    builder: (BuildContext context, ProductController value, Widget? child) {
      return IconButton(
        onPressed: () {
          value.deleteProduct(productId);
        },
        icon: const Icon(Icons.delete),
      );
    },
  );
}