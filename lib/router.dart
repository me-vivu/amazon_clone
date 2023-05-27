import 'package:amazon_clone/common/bottom_bar.dart';
import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/auth/screens/authScreen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';

import 'features/home/screens/category_deals.dart';
import 'models/product.dart';


Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName:
       return MaterialPageRoute(
           settings: routeSettings,
           builder: (_)=> const AuthScreen()
       );

    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=> const HomeScreen()
      );


    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=> const BottomBar()
      );

    case AddProductScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=> const AddProductScreen()
      );

    case CategoryDeals.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=>CategoryDeals(category: category,)
      );

    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=>SearchScreen(searchQuery: searchQuery,)
      );

    case ProductDetail.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=>ProductDetail(product: product,)
      );

    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=> const Scaffold(
            body: Center(
              child: Text('Page Not Found!!'),
            ),
          )
      );
  }
}