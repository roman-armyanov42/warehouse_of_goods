import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:warehouse_of_goods_application/features/product/data/datasources/remote/database/database.dart';
import 'package:warehouse_of_goods_application/features/product/data/datasources/remote/database/products_dao.dart';
import 'package:warehouse_of_goods_application/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse_of_goods_application/features/product/presentation/widgets/product_dialog_widget.dart';
import 'package:warehouse_of_goods_application/features/product/presentation/widgets/product_list_widget.dart';

import '../bloc/product_state.dart';
import '../../domain/entities/product.dart';

final db = AppDatabase();
final dao = productDao(db);

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Склад товаров')),

      // ЗАГРУЗКА ДАННЫХ ПРИ ОТКРЫТИИ ЭКРАНА
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductError) {
            return Center(child: Text('Ошибка: ${state.message}'));
          }

          if (state is ProductLoaded) {
            final products = state.products;

            if (products.isEmpty) {
              return const Center(child: Text('Список пуст'));
            }

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductListItem(
                  product: product,
                  onDelete: () {
                    cubit.deleteProduct(product.id);

                    print("Был удален объект:" + product.name);
                  },
                  onEdit: () async {
                    final result = await showDialog(
                      context: context,
                      builder: (_) => ProductDialog(product: product),
                    );

                    if (result != null) {
                      final updated = product.copyWith(
                        name: result['name'],
                        count: result['quantity'],
                        category: result['category'],
                      );

                      cubit.updateProduct(updated);
                    }
                  },
                  // onEdit: () => print(object),
                );
              },
            );
          }

          // Состояние ProductInitial
          return const SizedBox();
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await showDialog(
            context: context,
            builder: (context) => const ProductDialog(product: null),
          );

          if (result == null) return;

          await db
              .into(db.products)
              .insertOnConflictUpdate(
                ProductsCompanion(
                  name: Value(result['name']),
                  count: Value(result['quantity']),
                  category: Value(result['category']),
                ),
              );

          // ПЕРЕЗАГРУЖАЕМ БД ПОСЛЕ ДОБАВЛЕНИЯ
          cubit.loadProducts();
        },
      ),
    );
  }
}
