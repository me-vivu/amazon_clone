import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/home/screens/category_deals.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class TopCategories extends StatelessWidget {
  const TopCategories({Key? key}) : super(key: key);

  void navigateToCategory(BuildContext context, String category){
    Navigator.pushNamed(context, CategoryDeals.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        itemCount: GlobalVariable.categoryImages.length,
          scrollDirection: Axis.horizontal,
          itemExtent: 75,
          itemBuilder: (context, index){
          
          return InkWell(
            onTap: (){
              navigateToCategory(context, GlobalVariable.categoryImages[index]['title']!);
            },
            child: Column(
              children: [
               Container(
                 padding: const EdgeInsets.symmetric(horizontal: 10, ),
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(50),
                   child: Image.asset(GlobalVariable.categoryImages[index]['image']!,
                   fit: BoxFit.cover,
                     height: 40,
                       width: 40,
                   ),
                 ),
               ),
               Text(GlobalVariable.categoryImages[index]['title']!,
               style: const TextStyle(
                 fontSize: 12,
                 fontWeight: FontWeight.w400,
               ),)
              ],
            ),
          );


      }),
    );
  }
}
