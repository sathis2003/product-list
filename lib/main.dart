import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:product_list_app/features/login/presentation/pages/login_page.dart';
import 'package:product_list_app/features/products/presentation/pages/product_list_page.dart';
import 'package:provider/provider.dart';
import 'features/login/data/repo/mockup_login_repo.dart';
import 'features/login/presentation/provider/login_provider.dart';
import 'features/products/data/repo/products_repo_impl.dart';
import 'features/products/domain/repo/product_repo.dart';
import 'features/products/presentation/provider/product_provider.dart';

void main() {
  runApp(
   MultiProvider(providers: [
     ChangeNotifierProvider(create: (_)=>LoginProvider(MockupLoginRepo())),
     Provider<ProductsRepo>(create: (_)=>ProductsRepoImpl(http.Client())),
     ChangeNotifierProvider(create: (context)=>ProductProvider(context.read<ProductsRepo>()))
   ],
   child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product List Assessment',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginPage(),
      routes: {
        '/home':(context)=>const ProductListPage(),
      },
    );
  }
}