import 'package:flutter/material.dart';
import '../models/model.dart';
import 'priceCounter.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail(this.product);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          "${product.name} (${product.price}€)",
          style: TextStyle(fontSize: 18),
        )),
        PriceCounter(product),
      ],
    );
  }
}
