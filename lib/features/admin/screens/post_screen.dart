import 'package:amazon_clone/features/account/widgets/product.dart';
import 'package:amazon_clone/features/admin/admin_services.dart';
import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

import '../../../common/loader.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final AdminService adminServices = AdminService();
  List<Product>? products;

  void navigatetoAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          products!.removeAt(index);
          setState(() {});
        });
  }

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  void fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
                itemCount: products!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final productData = products![index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 140,
                        child: SingleProduct(
                          image: productData.images[0],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(productData.name,
                                overflow: TextOverflow.ellipsis, maxLines: 2),
                          ),
                          IconButton(
                            onPressed: () {
                              deleteProduct(productData, index);
                            },
                            icon: const Icon(Icons.delete_outline),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
            floatingActionButton: FloatingActionButton(
              onPressed: navigatetoAddProduct,
              tooltip: 'Add a product',
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
