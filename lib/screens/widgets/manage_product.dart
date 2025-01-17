import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:month4_lesson3_homework/controllers/product_controller.dart';
import 'package:month4_lesson3_homework/models/product.dart';
import 'package:provider/provider.dart';

class ManageProduct extends StatefulWidget {
  final bool isEdit;
  final Product? product;

  const ManageProduct({
    super.key,
    required this.isEdit,
    this.product,
  });

  @override
  State<ManageProduct> createState() => _ManageProductState();
}

class _ManageProductState extends State<ManageProduct> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String productTitle = '';

  int productPrice = 0;

  void onSaveTapped(ProductController productController){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      if(widget.isEdit){
        productController.editProduct(widget.product!.id, productTitle, productPrice);
      }else{
        productController.addProduct(Product(
            id: UniqueKey().toString(),
            color: Colors.grey,
            text: productTitle,
            price: productPrice));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
      builder: (BuildContext context, controller, child){
        return AlertDialog(
          title: Text(widget.isEdit ? "Edit Product" : 'Add Product'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: widget.isEdit ? widget.product!.text : '',
                  validator: (String? value){
                    if(value == null || value.trim().isEmpty){
                      return 'Enter product title';
                    }
                    return null;
                  },
                  onSaved: (String? newValue) => productTitle = newValue ?? '',
                ),
                TextFormField(
                  initialValue: widget.isEdit ? widget.product!.price.toString() : '',
                  validator: (String? value){
                    if(value == null || value.trim().isEmpty){
                      return 'Enter product Price';
                    } else if(!(int.tryParse(value)!= null)){
                      return 'Enter Number';
                    }
                    return null;
                  },
                  onSaved: (String? newValue) => productPrice = int.parse(newValue!),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: ()=> Navigator.of(context).pop(),
                child: Text("Save"))
          ],
        );
      },
    );
  }
}
