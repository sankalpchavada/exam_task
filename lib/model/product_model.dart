class Product {
  final int id;
  final String productCategory;
  final String name;
  final String brand;
  final String description;
  final double basePrice;
  final bool inStock;
  final int stock;
  final String featuredImage;
  final String thumbnailImage;
  final List<String> storageOptions;
  final List<String> colorOptions;
  final String display;
  final String CPU;
  final String GPU;
  final Camera? camera;

  Product({
    required this.id,
    required this.productCategory,
    required this.name,
    required this.brand,
    required this.description,
    required this.basePrice,
    required this.inStock,
    required this.stock,
    required this.featuredImage,
    required this.thumbnailImage,
    required this.storageOptions,
    required this.colorOptions,
    required this.display,
    required this.CPU,
    required this.GPU,
    required this.camera
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      productCategory: json['productCategory'],
      name: json['name'],
      brand: json['brand'],
      description: json['description'],
      basePrice: json['basePrice'].toDouble(),
      inStock: json['inStock'],
      stock: json['stock'],
      featuredImage: json['featuredImage'],
      thumbnailImage: json['thumbnailImage'],
      storageOptions: List<String>.from(json['storageOptions']),
      colorOptions: List<String>.from(json['colorOptions']),
      display: json['display'],
      CPU: json['CPU'],
      GPU: json['GPU'],
      camera: Camera.fromJson(json['camera']),
    );
  }
}

class Camera {
  final String rearCamera;
  final String frontCamera;

  Camera({
    required this.rearCamera,
    required this.frontCamera,
  });

  factory Camera.fromJson(Map<String, dynamic> json) {
    return Camera(
      rearCamera: json['rearCamera'],
      frontCamera: json['frontCamera'],
    );
  }




}

