class Product {
  final double price;
  int quantity;

  Product({
    required this.price,
    this.quantity = 0,
  });

  static List<Product> products = [
    Product(price: 22.50),
    Product(price: 52.50),
    Product(price: 30.00),
  ];
}
