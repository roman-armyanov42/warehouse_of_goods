import 'package:warehouse_of_goods_application/features/product/domain/entities/product.dart';

import '../repositories/product_repository.dart';

class AddProduct {
  final ProductRepository repository;

  AddProduct(this.repository);

  Future<void> call(ProductEntity product) async {
    if (product.name.isEmpty) {
      throw Exception("Название продукта не может быть пустым");
    }

    await repository.addProduct(product);
  }
}
