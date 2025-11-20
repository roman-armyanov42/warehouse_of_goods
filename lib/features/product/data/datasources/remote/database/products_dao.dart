import 'package:drift/drift.dart';
import 'package:dartz/dartz.dart';

import 'package:warehouse_of_goods_application/features/product/data/datasources/remote/database/database.dart';
import 'package:warehouse_of_goods_application/features/product/data/datasources/remote/database/tables.dart';
import 'package:warehouse_of_goods_application/features/core/error/products_failure.dart';

part 'products_dao.g.dart';

@DriftAccessor(tables: [Products])
class ProductDao extends DatabaseAccessor<AppDatabase> with _$productDaoMixin {
  ProductDao(super.attachedDatabase);

  Future<Either<ProductFailure, List<Product>>> getAllCharacters() async {
    try {
      final result = await select(products).get();
      return Right(result);
    } on Exception catch (e) {
      return Left(ProductFailure.db(message: e.toString()));
    }
  }

  Future<void> insertCharacters(List<ProductsCompanion> companions) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(products, companions);
    });
  }

  Future<int> deleteAllCharacters() async {
    return delete(products).go();
  }

  Future<void> updateProduct(ProductsCompanion companion) async {
    await update(products).replace(companion);
  }

  Future<bool> existsByName(String name) async {
    final query = await (select(
      products,
    )..where((tbl) => tbl.name.equals(name))).get();

    return query.isNotEmpty;
  }
}
