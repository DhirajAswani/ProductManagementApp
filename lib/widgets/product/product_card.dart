import 'package:flutter/material.dart';
import 'price_tag.dart';
import '../ui_elements/title_default.dart';
import '../product/address_tag.dart';
import '../../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitlePriceRow()
  {
    return  Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TitleDefault(product.title),
                SizedBox(
                  width: 8.0,
                ),
                PriceTag(product.price.toString()),
                Text(''),
              ],
            ),
            margin: EdgeInsets.only(top: 10.0),
          );
  }


  Widget _buttonBar(BuildContext context)
  {
    return  ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.info,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () => Navigator.pushNamed<bool>(
                      context, '/product/' + productIndex.toString())),
              IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () => Navigator.pushNamed<bool>(
                      context, '/product/' + productIndex.toString()))
            ],
          );
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product.image),
         _buildTitlePriceRow(),
          AddressTag('Address Goes Here'),
          _buttonBar(context),

         
        ],
      ),
    );
    
  }
}
