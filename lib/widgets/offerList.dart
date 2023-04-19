import 'package:flutter/material.dart';
import 'package:kata_flutter/models/cart_product.dart';
import 'package:kata_flutter/models/model.dart';
import 'package:provider/provider.dart';
import 'offerScreen.dart';

class OfferList extends StatelessWidget {
  var offers = getOffers();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: offers.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Expanded(
                //padding: EdgeInsets.all(10),
                child: Text(
                  offers[index].name,
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
                    Provider.of<CartStore>(context, listen: false).reset();
                    return OfferScreen(offers[index].id);
                  }));
                },
                icon: const Icon(Icons.apps_outlined),
              ),
            ],
          ));
        });
  }
}
