import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';
import '../model/product_model.dart';

class ProductPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Catalog'),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            Product product = productController.products[index];
            return ListTile(
              leading: Image.network(product.thumbnailImage),
              title: Text(product.name),
              subtitle: Text("${product.brand} - ${product.basePrice}"),
              onTap: () {
                productController.selectProduct(product);
                // Navigate to product details page
              },
            );
          },
        ),
      ),
    );
  }
}
