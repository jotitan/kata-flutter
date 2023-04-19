

import 'package:flutter/material.dart';

class ProductSelected {
  final String product;
  final int count;
  final double cost;

  ProductSelected(this.product, this.count, this.cost);
}

class CartStore extends ChangeNotifier {
  Map<String, ProductSelected> products = {};
  
  void add(String product, int count, double cost){
    products[product] = ProductSelected(product, count, cost);
    notifyListeners();
  }

  void reset(){
    products = {};
  }

  double total(){
    double count = 0;
    products.forEach((key, value) {
      count+=value.cost;
    });
    return count;
    //return products.entries.map((p)=>p.value.cost).reduce((value, element) => value + element).toDouble();
  }
}