import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update-product.dart';
import 'package:store_app/widgets/Custom_button.dart';
import 'package:store_app/widgets/Custom_text_field.dart';

class Updateproductpage extends StatefulWidget {
  Updateproductpage({super.key});
  static String id = 'update product';

  @override
  State<Updateproductpage> createState() => _UpdateproductpageState();
}

class _UpdateproductpageState extends State<Updateproductpage> {
  String? productName, desc, image;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: 'description',
                ),
                SizedBox(height: 10),
                CustomTextField(
                  inputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'price',
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hintText: 'image',
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: 'Update',
                  onTap: () async{
                    isLoading = true;
                    setState(() {});
                    try {
                       await updateProduct(product);
                      print('success');
                    } catch (e) {
                      print(e.toString());
                     
                    }
                     isLoading = false;
                      setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future <void> updateProduct(ProductModel product) async{
  await  UpdateProduct().updateProduct(
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      description: desc == null ? product.description : desc!,
      image: image == null ? product.image : image!,
      category: product.category,
      id: product.id,
    );
   
  }
}
