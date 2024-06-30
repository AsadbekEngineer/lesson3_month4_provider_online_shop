import 'package:month4_lesson3_homework/models/product.dart';

class Order{
  final String id;
  final List<Product> products;
  final DateTime dateTime;

  Order({
   required this.id,
   required this.products,
   required this.dateTime,
});
}