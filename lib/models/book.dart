class Book {
  final String title;
  final String auther;
  final String urlImage;
  final String category;
  final double price;
  final bool onSale;
  double? priceOnSale;
  Book({
    required this.title,
    required this.auther,
    required this.urlImage,
    required this.category,
    required this.price,
    required this.onSale,
    this.priceOnSale,
  });
}
