import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';

class ProductListItem extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ProductListItem({
    super.key,
    required this.product,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('Кол-во: ${product.count}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.green),
            onPressed: onEdit,
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
