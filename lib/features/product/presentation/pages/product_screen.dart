import 'package:flutter/material.dart';
import 'package:warehouse_of_goods_application/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse_of_goods_application/features/product/presentation/widgets/product_dialog_widget.dart';
import 'package:warehouse_of_goods_application/features/product/presentation/widgets/product_list_widget.dart';

import '../bloc/product_state.dart';
import '../../domain/entities/product.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductCubit>();

    return Scaffold(
      appBar: AppBar(title: Text('Склад товаров')),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            final products = state.products;
            if (products.isEmpty) return Center(child: Text('Список пуст'));

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductListItem(
                  product: product,
                  onDelete: () => cubit.deleteProduct(product.id),
                );
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text('Ошибка: ${state.message}'));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => ProductDialogWidget()
        /*async {
          final newProduct = ProductEntity(
            id: DateTime.now().millisecondsSinceEpoch,
            name: 'Новый товар',
            count: 1,
            price: 100.0,
            categoryNumber: 0,
          );
          await cubit.addProduct(newProduct);
        },*/,
      ),
    );
  }
}
