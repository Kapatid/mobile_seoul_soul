class Product {
  late String image;
  final String name;
  final double price;
  final String description;

  Product(String image, this.name, this.price, this.description) {
    this.image = 'https://source.unsplash.com/$image/640x426';
  }
}
