import 'package:flutter/material.dart';
import 'package:kata_flutter/cart_product.dart';
import 'package:kata_flutter/model.dart';
import 'package:provider/provider.dart';

class ListOffer extends StatelessWidget {
  const ListOffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getOffers().map((o) {
        return Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Expanded(
              //padding: EdgeInsets.all(10),
              child: Text(
                o.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  Provider.of<CartStore>(context,listen:false).reset();
                  return OfferView(o.id);
                }));
              },
              icon: const Icon(Icons.apps_outlined),
            ),
          ],
        );
      }).toList(),
    );
  }
}

class OfferView extends StatelessWidget {
  final int id;

  OfferView(this.id);

  @override
  Widget build(BuildContext context) {
    Offer? o = getOffer(this.id);
    if (o == null) {
      return Text("Erreur");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(o.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: OfferBodyView(o),
    );
  }
}

class OfferBodyView extends StatelessWidget {
  final Offer offer;

  OfferBodyView(this.offer);

  Widget getImage() {

    if (!offer.hasImage) {
      return Text("");
    }
    return Image.network(this.offer.image);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getImage(),
        Container(
          padding: EdgeInsets.all(10),
          child: ProductsView(this.offer.products),
        )
      ],
    );
  }
}

class ProductsView extends StatelessWidget {
  final List<Product> products;

  ProductsView(this.products);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        children: this.products.map((p) => ProductView(p)).toList(),
      ),
      Consumer<CartStore>(
        builder: (context, cart, child) {
          return Text("Total : € ${cart.total()}");
        },
      )
    ]);
  }
}

class ProductView extends StatelessWidget {
  final Product product;

  ProductView(this.product);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          "${product.name} (${product.price}€)",
          style: TextStyle(fontSize: 18),
        )),
        Counter(product),
      ],
    );
  }
}

class Counter extends StatefulWidget {
  final Product product;

  Counter(this.product);

  @override
  State<Counter> createState() => CounterState();
}

class CounterState extends State<Counter> {
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
