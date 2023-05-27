import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../constants/errorHandeling.dart';
import '../../../constants/global_variable.dart';
import '../../../constants/utils.dart';
import '../../../models/product.dart';
import '../../../providers/user_provider.dart';
import 'package:http/http.dart' as http;

class SearchServices{
  Future<List<Product>> fetchCategoryProducts({
    required BuildContext context,
    required String searchQuery,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> searchProduct = [];

    try {
      http.Response res = await http
          .get(Uri.parse('$uri/api/products/search/$searchQuery'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'auth-token': userProvider.user.token,
          }
      );


      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              searchProduct.add(
                Product.fromJson(
                  jsonEncode(
                    jsonDecode(res.body)[i],
                  ),
                ),
              );
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return searchProduct;
  }
}