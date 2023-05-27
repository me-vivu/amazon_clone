import 'package:amazon_clone/common/custom_button.dart';
import 'package:amazon_clone/common/stars.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constants/global_variable.dart';
import '../../../models/product.dart';
import '../../search/screens/search_screen.dart';

class ProductDetail extends StatefulWidget {
  static const String routeName = '/product-details';
  final Product product;
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  void navigateToSearchScreen(String query){
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child:  AppBar(
          flexibleSpace:  Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariable.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                    height: 42,
                    margin: const EdgeInsets.only(left: 15),
                    child: Material(
                      borderRadius: BorderRadius.circular(7),
                      elevation: 1,
                      child: TextFormField(
                        onFieldSubmitted: navigateToSearchScreen,
                        decoration: InputDecoration(
                            prefixIcon: InkWell(
                              onTap: (){},
                              child: const Padding(padding: EdgeInsets.only(left: 6),
                                child: Icon(Icons.search,
                                  color: Colors.black,
                                  size: 23,),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(top: 10),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                              borderSide: BorderSide(color: Colors.black38, width: 1),
                            ),
                            hintText: 'Search Amazon.in',
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            )
                        ),
                      ),
                    )
                ),
              ),

              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.mic, color: Colors.black, size:  25,),
              )

            ],

          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.product.id!),
                  const Stars(rating: 4),

                ],
              ),
            ),

            Padding(padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10
            ),
              child: Text(widget.product.name,
              style: const TextStyle(
                fontSize: 15,
              ),),
            ),

            CarouselSlider(
              items: widget.product.images.map((i) {
                return Builder(
                    builder: (BuildContext context) => Image.network(
                      i,
                      fit: BoxFit.contain,
                      height: 200,
                    ) );
              }).toList(),
              options: CarouselOptions(viewportFraction: 1, height: 300),
            ),

            Container(
              color: Colors.black12,
              height: 5,
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: 'Deal Price', style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,

              ),
                  children: [
                  TextSpan(
                  text: '\$${widget.product.price}', style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    ))

                  ]
              ),
            ),),
            
            Padding(padding: const EdgeInsets.all(8),
              child: Text(widget.product.description),

            ),

            Container(
              color: Colors.black12,
              height: 5,
            ),
            
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(text: 'Buy Now', onTap: (){}),
            ),
            const SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(
                  color: const Color.fromRGBO(254, 216, 19, 1),
                  text: 'Add to Cart',
                  onTap: (){}),
            ),
            const SizedBox(height: 10,),

            Container(
              color: Colors.black12,
              height: 5,
            ),

            const Padding(
              padding: EdgeInsets.all(10),
              child: Text("Rate the Product",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),),

            ),
            
            RatingBar.builder(
              initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: GlobalVariable.secondaryColor,
                ),
                onRatingUpdate: (rating){},

            )




          ],
        ),
      ),
    );
  }
}
