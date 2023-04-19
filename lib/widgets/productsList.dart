import 'package:flutter/material.dart';
import 'package:kata_flutter/widgets/productDetail.dart';
import 'package:provider/provider.dart';
import '../models/cart_product.dart';
import '../models/model.dart';

class ProductsList extends StatelessWidget {
  final List<Product> products;

  ProductsList(this.products);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        children: this.products.map((p) => ProductDetail(p)).toList(),
      ),
      Consumer<CartStore>(
        builder: (context, cart, child) {
          return Text("Total : € ${cart.total()}");
        },
      )
    ]);
  }
}