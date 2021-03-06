import 'package:flutter/material.dart';
import './product_edit.dart';
import '../models/product.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/product.dart';

class ProductListPage extends StatelessWidget {
  // final Function updateProduct;
  Widget _buildEditButton(BuildContext context, int index,ProductsModel model) {
     return IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            model.selectProduct(index);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return ProductEditPage();
              }),
            );
          },
        );
  
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(model.products[index].title),
              onDismissed: (DismissDirection direction) {
                model.selectProduct(index);
                if (direction == DismissDirection.endToStart) {
                  print("Swiped end to start");
                  model.deleteProduct();
                }
                // else if(direction == DismissDirection.startToEnd)
                // {
                //   print('start to end');
                // }
                // else{
                //   print('other than this');
                // }
              },
              background: Container(
                color: Colors.red,
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(model.products[index].image),
                    ),
                    title: Text(
                      model.products[index].title,
                    ),
                    subtitle: Text('\$${model.products[index].price}'),
                    trailing: _buildEditButton(context, index,model),
                  ),
                  Divider(
                    color: Theme.of(context).accentColor,
                    // indent: 10.0,
                    // height: 5.0,
                  ),
                ],
              ),
            );
          },
          itemCount: model.products.length,
        );
      },
    );
  }
}
