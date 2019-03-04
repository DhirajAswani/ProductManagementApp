import 'package:flutter/material.dart';



class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  

  ProductManager(this.products);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
        new Expanded(child:new Center(
          child: new Text('hello'),
         ),
        ),
      ],
        
    );
  }
}
