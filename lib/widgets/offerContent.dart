import 'package:flutter/material.dart';
import 'package:kata_flutter/widgets/productsList.dart';
import '../models/model.dart';

class OfferContent extends StatelessWidget {
  final Offer offer;

  OfferContent(this.offer);

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
          child: ProductsList(this.offer.products),
        )
      ],
    );
  }
}
