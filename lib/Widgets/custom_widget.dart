import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/Models/product_model.dart';

class CustomCard extends StatelessWidget {
  final ProductModel productModel;
  const CustomCard({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'updateProduct', arguments: productModel);
      },
      child: Hero(
        tag: productModel.image,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 40,
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0,
                    offset: const Offset(10, 10),
                  ),
                ],
              ),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productModel.title,
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(r'$' '${productModel.price}'),
                          const Icon(
                            FontAwesomeIcons.heart,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: -40,
              child: Image.network(
                productModel.image,
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
