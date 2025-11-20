import 'package:warehouse_of_goods_application/features/product/domain/entities/product.dart';
import 'package:warehouse_of_goods_application/features/product/domain/repositories/product_repository.dart';

class ExistsByName {
  final ProductRepository repository;

  ExistsByName(this.repository);
  Future<bool> call(String name) async {
    return await repository.existsByName(name);
  }
}
