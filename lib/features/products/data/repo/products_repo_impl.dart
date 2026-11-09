import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:product_list_app/features/products/data/models/product_model.dart';

import '../../domain/repo/product_repo.dart';

class ProductsRepoImpl implements ProductsRepo{
  final http.Client client;
  ProductsRepoImpl(this.client);

  @override
  Future<List<ProductModel>> getProducts() async{
    final url =Uri.parse("https://dummyjson.com/products");
    final response=await client.get(url);
    if(response.statusCode==200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List productsJson = data['products'];

      return productsJson.map(
              (json) => ProductModel.fromJson(json)).toList();
    }else{
      throw Exception('Failed to load products');
    }
  }
}