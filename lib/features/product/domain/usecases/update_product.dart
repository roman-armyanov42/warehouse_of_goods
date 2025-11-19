import 'package:warehouse_of_goods_application/features/product/domain/entities/product.dart';
import 'package:warehouse_of_goods_application/features/product/domain/repositories/product_repository.dart';

class UpdateProduct {
  final ProductRepository repository;

  UpdateProduct(this.repository);

  Future<void> call(ProductEntity product) async {
    if (product.name.isEmpty) {
      throw Exception("Название продукта не может быть пустым");
    }
    await repository.updateProduct(product);
  }
}
