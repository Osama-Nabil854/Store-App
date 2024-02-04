import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/Models/product_model.dart';
import 'package:store/Services/update_product.dart';
import 'package:store/Widgets/custom_button.dart';
import 'package:store/Widgets/customtext_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image;
  num? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: productModel.image,
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(productModel.image),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    hintText: 'product name',
                    onChanged: (value) {
                      productName = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: 'description',
                    onChanged: (value) {
                      description = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: 'price',
                    onChanged: (value) {
                      if (price == null) {
                        // Show an error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Invalid price format")),
                        );
                        return;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: 'image',
                    onChanged: (value) {
                      image = value;
                    },
                  ),
                  const SizedBox(height: 50),
                  CustomButton(
                    text: 'Update',
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await updateProduct(productModel);
                        log('SUCCESS');
                      } catch (e) {
                        log(e.toString());
                      }
                      try {} catch (e) {
                        log(e.toString());
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel productModel) async {
    await UpdateProductServices().addProdcut(
      title: productName ?? productModel.title,
      price: price ?? productModel.price,
      description: description ?? productModel.description,
      image: image ?? productModel.image,
      category: productModel.category,
      id: productModel.id.toString(),
    );
  }
}
