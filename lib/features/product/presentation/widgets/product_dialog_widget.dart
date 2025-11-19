import 'package:flutter/material.dart';
import 'package:warehouse_of_goods_application/features/product/domain/entities/product.dart';

class ProductDialog extends StatefulWidget {
  final ProductEntity? product;

  const ProductDialog({super.key, this.product});

  @override
  State<ProductDialog> createState() => _ProductDialogState();
}

class _ProductDialogState extends State<ProductDialog> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Если редактирование — заполняем поля
    if (widget.product != null) {
      _nameController.text = widget.product!.name;
      _categoryController.text = widget.product!.category;
      _quantityController.text = widget.product!.count.toString();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product == null
                    ? "Добавить товар"
                    : "Редактировать товар",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              /// Название
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Название товара *",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Введите название" : null,
              ),
              const SizedBox(height: 12),

              /// Категория
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  labelText: "Категория *",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Введите категорию" : null,
              ),
              const SizedBox(height: 12),

              /// Количество
              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Количество *",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Введите количество";
                  }
                  final numValue = int.tryParse(value);
                  if (numValue == null || numValue < 0) {
                    return "Введите корректное число";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Отмена"),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context, {
                          'name': _nameController.text,
                          'category': _categoryController.text,
                          'quantity':
                              int.tryParse(_quantityController.text) ?? 0,
                        });
                      }
                    },
                    child: const Text("Сохранить"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
