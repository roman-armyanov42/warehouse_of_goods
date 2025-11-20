import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:warehouse_of_goods_application/features/product/domain/entities/product.dart';
import 'package:warehouse_of_goods_application/features/product/domain/repositories/product_repository.dart';

class ProductDialog extends StatefulWidget {
  final ProductEntity? product;
  final ProductRepository repository;
  const ProductDialog({super.key, this.product, required this.repository});

  @override
  State<ProductDialog> createState() => _ProductDialogState();
}

class _ProductDialogState extends State<ProductDialog> {
  final _formKey = GlobalKey<FormState>();
  String? _nameError;
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _quantityController = TextEditingController();
  bool isNameEdited = false;
  bool isExists = false;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    // Если редактирование — заполняем поля
    if (widget.product != null) {
      isEditing = true;
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
                onChanged: (value) {
                  log("Текст изменен: $value");

                  isNameEdited = true;
                },
                decoration: InputDecoration(
                  labelText: "Название товара *",
                  errorText: _nameError,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? "Введите название"
                    : _nameError,
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
                decoration: InputDecoration(
                  labelText: "Количество *",
                  border: const OutlineInputBorder(),
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
                    onPressed: () async {
                      final name = _nameController.text;
                      if (name.isEmpty) return;

                      if (!isEditing || isNameEdited) {
                        isExists = await widget.repository.existsByName(name);
                      }

                      log(isExists.toString());
                      if (isExists) {
                        setState(
                          () => _nameError =
                              "Товар с таким именем уже существует",
                        );
                        return;
                      } else {
                        setState(() => _nameError = null);
                      }
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
