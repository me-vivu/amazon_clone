import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/account/widgets/product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  List proList = [
    'https://cdn.shopify.com/s/files/1/0702/9017/8333/files/Bliss_Homepage_Banner_Image_Mobile_2x_copy.jpg?v=1678733951',
    'https://cdn11.bigcommerce.com/s-d7wmc7b75m/images/stencil/original/image-manager/10-22-method-carousel-allproducts-mobile.jpg?t=1664826166',
    'https://cdn.shopify.com/s/files/1/0702/9017/8333/files/Bliss_Homepage_Banner_Image_Mobile_2x_copy.jpg?v=1678733951',
    'https://cdn11.bigcommerce.com/s-d7wmc7b75m/images/stencil/original/image-manager/10-22-method-carousel-allproducts-mobile.jpg?t=1664826166',

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text('Your Orders',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: const Text('See all',
                style: TextStyle(
                  color: Colors.black,

                ),),
            ),

          ],
        ),

        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: proList.length,
              itemBuilder: (context, index){
                return SingleProduct(image: proList[index]);



          }),
        )
      ],
    );
  }
}
