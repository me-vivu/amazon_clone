import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15),
          child: const Text('Deal of the Day',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),

        ),
        
        Image.network('https://cdn11.bigcommerce.com/s-d7wmc7b75m/images/stencil/original/image-manager/10-22-method-carousel-allproducts-mobile.jpg?t=1664826166',
        height: 235,
        fit: BoxFit.fitHeight,),

        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, ),

          child: const Text(
            '\$100',
            style:  TextStyle(
              fontSize: 18,
            ),
          ),

        ),

        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40 ),
          child: const Text(
            'Vivek',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

        ),

        SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Image.network('https://www.volusion.com/blog/content/images/2021/09/Product-Photography.jpeg', fit: BoxFit.fitWidth, width: 200, height: 200,),
              Image.network('https://www.volusion.com/blog/content/images/2021/09/Product-Photography.jpeg', fit: BoxFit.fitWidth, width: 200, height: 200,),
              Image.network('https://www.volusion.com/blog/content/images/2021/09/Product-Photography.jpeg', fit: BoxFit.fitWidth, width: 200, height: 200,),
              Image.network('https://www.volusion.com/blog/content/images/2021/09/Product-Photography.jpeg', fit: BoxFit.fitWidth, width: 200, height: 200,),
              Image.network('https://www.volusion.com/blog/content/images/2021/09/Product-Photography.jpeg', fit: BoxFit.fitWidth, width: 200, height: 200,),


          ]
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15
          ).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            'See all deals',
            style: TextStyle(
              color: Colors.cyan[800],
            ),
          ),

        )
      ],
    );
  }
}
