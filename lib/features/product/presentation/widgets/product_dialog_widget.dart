import 'package:flutter/material.dart';

class ProductDialogWidget extends StatelessWidget {
  const ProductDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize:
              MainAxisSize.min, 
          children: [
            const Text(
              "Товар",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text("Описание товара или другая информация."),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Закрыть"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
