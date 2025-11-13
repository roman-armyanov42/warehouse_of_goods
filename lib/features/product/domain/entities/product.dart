class ProductEntity {
  const ProductEntity({
    required this.name,
    required this.id,
    required this.count,
    required this.price,
    required this.category,
  });
  final String name;
  final int id;
  final int count;
  final double price;
  final String category;
}
