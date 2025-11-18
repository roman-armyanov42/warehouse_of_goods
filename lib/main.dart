import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse_of_goods_application/features/product/data/repositories/product_repository.dart';
import 'package:warehouse_of_goods_application/features/product/domain/usecases/add_product.dart';
import 'package:warehouse_of_goods_application/features/product/domain/usecases/delete_product.dart';
import 'package:warehouse_of_goods_application/features/product/presentation/bloc/product_bloc.dart';
import 'package:warehouse_of_goods_application/features/product/presentation/pages/product_screen.dart';

import 'features/product/data/datasources/remote/database/database.dart';
import 'features/product/data/datasources/remote/database/products_dao.dart';

void main() {
  // Инициализация базы данных
  final db = AppDatabase();
  final dao = productDao(db);

  // Репозиторий
  final repository = ProductRepositoryImpl(db);

  // UseCases
  final addUseCase = AddProduct(repository);
  final deleteUseCase = DeleteProduct(repository);

  runApp(MyApp(addUseCase: addUseCase, deleteUseCase: deleteUseCase, dao: dao));
}

class MyApp extends StatelessWidget {
  final AddProduct addUseCase;
  final DeleteProduct deleteUseCase;
  final productDao dao;

  const MyApp({
    super.key,
    required this.addUseCase,
    required this.deleteUseCase,
    required this.dao,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Склад товаров',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) =>
            ProductCubit(addUseCase, deleteUseCase, dao)..loadProducts(),
        child: const ProductScreen(),
      ),
    );
  }
}
