import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';
import '../widgets/product_card.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductProvider>().fetchProducts();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFA9698),
        foregroundColor: const Color(0xFF3B1F20),
        title: const Text(
          'Product details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (productProvider.errorMessage != null) {
            return Center(child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline,size: 50,color: Colors.red,),
                const SizedBox(height: 16),
                Text(productProvider.errorMessage!,textAlign: TextAlign.center,),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    productProvider.fetchProducts();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ));
          }
          if(productProvider.products.isEmpty){
            return const Center(child: Text('No products found'));
          }
          return ListView.builder(
            itemCount: productProvider.products.length,
            itemBuilder: (context, index) {
              final product = productProvider.products[index];
              return ProductCard(product: product);
            }
          );
}
    )
    );
  }
}
