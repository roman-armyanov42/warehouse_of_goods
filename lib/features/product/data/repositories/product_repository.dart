import 'package:drift/drift.dart';
import 'package:warehouse_of_goods_application/features/product/data/datasources/remote/database/database.dart';
import 'package:warehouse_of_goods_application/features/product/domain/entities/product.dart';
import 'package:warehouse_of_goods_application/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final AppDatabase db;

  ProductRepositoryImpl(this.db);

  @override
  Future<void> addProduct(ProductEntity product) async {
    await db
        .into(db.products)
        .insert(
          ProductsCompanion.insert(
            name: product.name,
            id: Value(product.id),
            count: product.count,
            category: product.category,
            // другие поля
          ),
        );
  }

  @override
  Future<void> deleteProduct(int id) async {
    await (db.delete(db.products)..where((tbl) => tbl.id.equals(id))).go();
  }

  @override
  Future<void> updateProduct(ProductEntity product) async {
    await db
        .update(db.products)
        .replace(
          ProductsCompanion(
            name: Value(product.name),
            count: Value(product.count),
            category: Value(product.category),
          ),
        );
  }
}
