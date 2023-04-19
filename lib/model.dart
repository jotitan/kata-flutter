
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
  const String img1= "https://www.whiskas.fr/cdn-cgi/image/format=auto,q=90/sites/g/files/fnmzdf3496/files/2022-09/mon-chat-nest-pas-calin-que-faire_3_0.jpg";
  const String img2 = "https://s3-eu-west-1.amazonaws.com/blog-ecotree/blog/0001/03/7c1b40313dae3d92dc4043eec621f85b2e07b9a8.jpeg";
  switch(id){
    case 1:return Offer(1,"Mock offer 1",image: img1, hasImage:true, products: [Product("Prod 1", 12, 25),Product("Prod 2", 6.5, 4)]);break;
    case 2:return Offer(2,"Mock offer 2",image:img2, hasImage:true, products: [Product("Poulpe", 9.5, 2),Product("Crevette", 12.75, 8),Product("Saumon", 50, 1)]);break;
    case 3:return Offer(3,"Mock offer 3",products: [Product("Tagada", 2.5, 10),Product("M&Ms", 13.2, 4),Product("Malabar", 0.5, 40)]);break;
    default: return null;
  }
}