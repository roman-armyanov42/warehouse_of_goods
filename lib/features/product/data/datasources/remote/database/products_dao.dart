import 'package:drift/drift.dart';
import 'package:dartz/dartz.dart';

import 'package:warehouse_of_goods_application/features/product/data/datasources/remote/database/database.dart';
import 'package:warehouse_of_goods_application/features/product/data/datasources/remote/database/tables.dart';
import 'package:warehouse_of_goods_application/features/core/error/products_failure.dart';

part 'products_dao.g.dart';

@DriftAccessor(tables: [Products])
class productDao extends DatabaseAccessor<AppDatabase> with _$productDaoMixin {
  productDao(super.attachedDatabase);

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
}
