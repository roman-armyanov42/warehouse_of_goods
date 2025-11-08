import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';

class ProductListItem extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback onDelete;

  const ProductListItem({
    super.key,
    required this.product,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('Цена: ${product.price}  |  Кол-во: ${product.count}'),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red),
        onPressed: onDelete,
      ),
    );
  }
}
