import 'package:flutter/material.dart';

class ProductDialog extends StatefulWidget {
  const ProductDialog({super.key});

  @override
  State<ProductDialog> createState() => _ProductDialogState();
}

class _ProductDialogState extends State<ProductDialog> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _quantityController = TextEditingController();

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
              const Text(
                "Добавить товар",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Название
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

              // Категория
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

              // Количество
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

              // Кнопки
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Отмена"),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final name = _nameController.text;
                        final category = _categoryController.text;
                        final quantity =
                            int.tryParse(_quantityController.text) ?? 0;

                        Navigator.of(context).pop({
                          'name': name,
                          'category': category,
                          'quantity': quantity,
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
