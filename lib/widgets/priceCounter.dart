import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_product.dart';
import '../models/model.dart';

class PriceCounter extends StatefulWidget {
  final Product product;

  PriceCounter(this.product);

  @override
  State<PriceCounter> createState() => PriceCounterState();
}

class PriceCounterState extends State<PriceCounter> {
  int counter = 0;

  void add(CartStore store) {
    if(counter >= widget.product.quantity){
      return;
    }
    setState(() {
      counter++;
      store.add(widget.product.name, counter, counter * widget.product.price);
    });
  }

  void remove(store) {
    if(counter == 0){
      return;
    }
    setState(() {
      counter--;
      store.add(widget.product.name, counter, counter * widget.product.price);
    });
  }

  @override
  Widget build(BuildContext context) {
    var store = context.select<CartStore, CartStore>((cart) => cart);
    return Row(children: [
      IconButton(
        icon: Icon(Icons.remove),
        onPressed: () {
          remove(store);
        },
      ),
      Text("${counter}"),
      IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          add(store);
        },
      ),
    ]);
  }
}
