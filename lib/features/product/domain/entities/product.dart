class ProductEntity {
  const ProductEntity({
    required this.name,
    required this.id,
    required this.count,
    required this.category,
  });
  final String name;
  final int id;
  final int count;
  final String category;

  ProductEntity copyWith({
    int? id,
    String? name,
    int? count,
    String? category,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      count: count ?? this.count,
      category: category ?? this.category,
    );
  }
}
