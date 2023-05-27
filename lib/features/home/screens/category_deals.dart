import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

import '../../../common/loader.dart';
import '../../../constants/global_variable.dart';

class CategoryDeals extends StatefulWidget {
  final String category;
  static const String routeName = '/category-deals';
  const CategoryDeals({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryDeals> createState() => _CategoryDealsState();
}

class _CategoryDealsState extends State<CategoryDeals> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  void fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
        context: context, category: widget.category);
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariable.appBarGradient,
              ),
            ),
            title: Text(
              widget.category,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )),
      ),
      body: productList == null
          ? const Loader()
          : Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                alignment: Alignment.topLeft,
                child: Text('keep shopping for ${widget.category}',
                    style: const TextStyle(
                      fontSize: 20,
                    )),
              ),
              SizedBox(
                height: 170,
                child: GridView.builder(
                    itemCount: productList!.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 15),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.4,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {

                      final product = productList![index];
                      return InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, ProductDetail.routeName, arguments: product);
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 130,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 0.5
                                  )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.network(
                                    product.images[0],),
                                ),
                              ),

                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(
                                  left: 0,
                                  top: 5,
                                  right: 15
                              ),
                              child: Text(product.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                            )
                          ],
                        ),
                      );
                    }),
              ),

            ],
          ),
    );
  }
}
