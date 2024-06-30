import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:month4_lesson3_homework/models/product.dart';

class ProductController extends ChangeNotifier{
  final List<Product> _products = [
    Product(
      id: UniqueKey().toString(),
      color: Colors.amber,
      text: 'MacBook Pro 14',
      price: 1999,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.teal,
      text: 'Dell XPS 13',
      price: 1299,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.indigo,
      text: 'Microsoft Surface Pro 7',
      price: 899,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.lime,
      text: 'HP Spectre x360',
      price: 1199,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.deepOrange,
      text: 'Lenovo ThinkPad X1',
      price: 1399,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.blueGrey,
      text: 'Razer Blade 15',
      price: 1599,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.deepPurple,
      text: 'Alienware m15',
      price: 1799,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.lightBlue,
      text: 'Acer Predator Helios 300',
      price: 1099,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.lightGreen,
      text: 'MSI GS66 Stealth',
      price: 1699,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.grey,
      text: 'Google Chromebook Pixel',
      price: 999,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.cyanAccent,
      text: 'Apple iPad Pro',
      price: 799,
    ),
  ];


  List<Product> get products => [..._products];

  void addProduct(Product product){
    _products.add(product);
  }

  void editProduct(String productId, String newTitle, int newPrice){
    int index = _products.indexWhere((element) => element.id == productId);
    if(index != -1){
      _products[index].updateProduct(newTitle, newPrice);
    }
    notifyListeners();
  }

  void deleteProduct(String productId) {
    _products.removeWhere((element) => element.id == productId);
    notifyListeners();
  }
}

