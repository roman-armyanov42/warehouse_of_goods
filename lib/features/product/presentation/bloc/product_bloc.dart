import 'package:bloc/bloc.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/add_product.dart';
import '../../domain/usecases/delete_product.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final AddProduct addProductUseCase;
  final DeleteProduct deleteProductUseCase;

  // Список продуктов в Cubit
  List<ProductEntity> _products = [];

  ProductCubit(this.addProductUseCase, this.deleteProductUseCase)
    : super(ProductInitial());

  // Получить текущие продукты
  List<ProductEntity> get products => _products;

  // Добавление продукта
  Future<void> addProduct(ProductEntity product) async {
    try {
      emit(ProductLoading());
      await addProductUseCase.call(product);
      _products.add(product);
      emit(
        ProductLoaded(List.from(_products)),
      ); // копия списка для обновления UI
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  // Удаление продукта по ID
  Future<void> deleteProduct(int id) async {
    try {
      emit(ProductLoading());
      await deleteProductUseCase.call(id);
      _products.removeWhere((p) => p.id == id);
      emit(ProductLoaded(List.from(_products)));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  // Можно добавить метод для инициализации или обновления списка из базы
  void setProducts(List<ProductEntity> products) {
    _products = products;
    emit(ProductLoaded(List.from(_products)));
  }
}
