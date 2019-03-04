import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;
  ProductControl(this.addProduct);
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      color: Theme.of(context).accentColor,
      textColor: Colors.white,
      onPressed: () {
        addProduct({'title': 'chocolate', 'image': 'assets/food.jpg'});
        // print(_products);
      },
      child: Text('Add Product'),
    );
  }
}
