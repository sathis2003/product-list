import 'package:flutter/cupertino.dart';
import '../../data/models/product_model.dart';
import '../../domain/repo/product_repo.dart';

class ProductProvider extends ChangeNotifier{
  final ProductsRepo _productsRepo;
  ProductProvider(this._productsRepo);
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _products = await _productsRepo.getProducts();
    }catch(e){
      _errorMessage = e.toString();
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}