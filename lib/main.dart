
import 'package:flutter/material.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update-product-page.dart';
import 'package:store_app/services/update-product.dart';

 void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id: (context) => HomePage(),
        Updateproductpage.id : (context) => Updateproductpage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
