import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/Models/product_model.dart';
import 'package:store/Services/get_all_product.dart';
import 'package:store/Widgets/custom_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'New Trend',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await AllProductServices().getAllPeoducts();
        },
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductServices().getAllPeoducts(),
          builder: (context, snapshot) {
            List<ProductModel>? product = snapshot.data;
            if (snapshot.hasData) {
              animationController.reset();
              animationController.forward();
              return GridView.builder(
                padding: const EdgeInsets.only(top: 65, left: 10, right: 10),
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 60,
                ),
                itemCount: product!.length,
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1, 0),
                          end: const Offset(0, 0),
                        ).animate(
                          CurvedAnimation(
                            parent: animationController,
                            curve: Interval(
                              index /
                                  product
                                      .length, // Use index to calculate delay
                              0.8,
                              curve: Curves
                                  .easeOut, // You can change the curve as needed
                            ),
                          ),
                        ),
                        child: child,
                      );
                    },
                    child: CustomCard(
                      productModel: product[index],
                    ),
                  );
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(
                children: const [
                  Text('Error'),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
