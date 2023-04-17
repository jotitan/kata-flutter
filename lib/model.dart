
class Offer {
  final int id;
  final String name;
  final bool hasImage;
  final String image;
  final List<Product> products;

  Offer(this.id, this.name,{this.hasImage = false, this.image = "", this.products = const []});
}

class Product {
  final String name;
  final double price;
  final int quantity;

  Product(this.name, this.price, this.quantity);
}

List<Offer> getOffers(){
  return [
      Offer(1,"Mock offer 1"),
      Offer(2,"Mock offer 2"),
      Offer(3,"Mock offer 3"),
  ];
}

Offer? getOffer(int id){
  switch(id){
    case 1:Offer(1,"Mock offer 1",products: [Product("Prod 1", 12, 25),Product("Prod 2", 6.5, 4)]);break;
    case 2:Offer(2,"Mock offer 2",products: [Product("Poulpe", 9.5, 2),Product("Crevette", 12.75, 8),Product("Saumon", 50, 1)]);break;
    case 3:Offer(3,"Mock offer 3",products: [Product("Tagada", 2.5, 10),Product("M&Ms", 13.2, 4),Product("Malabar", 0.5, 40)]);break;
    default: return null;
  }
}