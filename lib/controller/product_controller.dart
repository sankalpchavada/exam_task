import 'package:get/get.dart';
import '../model/product_model.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var selectedProduct = Rx<Product?>(null);

  void fetchProducts() {
    // Simulate fetching products from an API
    List<Product> fetchedProducts = [];

    products.assignAll(fetchedProducts);


    update();
  }

  void selectProduct(Product product) {
    selectedProduct.value = product;
    update();
  }

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

}
