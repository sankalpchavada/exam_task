import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/product_model.dart';

class ApiHelper {

  ApiHelper._();
 static final ApiHelper apiHelper = ApiHelper._();
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://dummyapi.online/api/products'));

    if (response.statusCode == 200) {
      List<Product> productList = [];
      List<dynamic> data = json.decode(response.body);

      for (var item in data) {
        productList.add(Product.fromJson(item));
      }

      return productList;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
