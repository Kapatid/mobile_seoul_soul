class Product {
  late String image;
  final String name;
  final double price;

  Product(String image, this.name, this.price) {
    this.image = 'https://source.unsplash.com/$image/640x426';
  }
}
