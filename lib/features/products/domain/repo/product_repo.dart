import 'package:product_list_app/features/products/data/models/product_model.dart';

abstract class ProductsRepo {
  Future<List<ProductModel>> getProducts();
}