// domain/usecases/delete_product.dart
import '../repositories/product_repository.dart';

class DeleteProduct {
  final ProductRepository repository;

  DeleteProduct(this.repository);

  Future<void> call(int id) async {
    await repository.deleteProduct(id);
  }
}
