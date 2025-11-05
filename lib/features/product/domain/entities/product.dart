class ProductEntity {
  const ProductEntity({
    required this.name,
    required this.id,
    required this.count,
    required this.price,
    required this.categoryNumber,
  });
  final String name;
  final int id;
  final int count;
  final double price;
  final int categoryNumber;
}
