import 'package:flutter/cupertino.dart';
import 'package:month4_lesson3_homework/models/order.dart';

class OrderController extends ChangeNotifier{
  final List<Order> _orders = [];

  List <Order> get orders => _orders;

  void addOrder(Order order){
    _orders.add(order);
    notifyListeners();
  }
}