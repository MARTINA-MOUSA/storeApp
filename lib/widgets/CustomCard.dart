import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update-product-page.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({
    required this.product,
    super.key,
  });
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Updateproductpage.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  color: const Color.fromARGB(255, 44, 19, 19).withOpacity(0.2),
                  spreadRadius: 0,
                  offset: const Offset(10, 10)),
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.substring(0, 6),
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              r'$' '${product.price.toString()}',
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ])
                    ]),
              ),
            ),
          ),
          Positioned(
              right: 32,
              top: -75,
              child: Image.network(
                product.image,
                height: 100,
                width: 100,
              )),
        ],
      ),
    );
  }
}
