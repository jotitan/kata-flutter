import 'package:flutter/material.dart';
import '../models/model.dart';
import 'offerContent.dart';

class OfferScreen extends StatelessWidget {
  final int id;

  OfferScreen(this.id);

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
      body: OfferContent(o),
    );
  }
}