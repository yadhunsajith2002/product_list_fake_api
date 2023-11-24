import 'dart:convert';

import 'package:fake_store_api/api_config/api_config.dart';
import 'package:fake_store_api/model/product_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomeController extends ChangeNotifier {
  bool isLoading = true;

  var uri = Uri.parse("${baseUrl}products");

  List<ProductModel> items = [];

  String error = '';

  fetchData() async {
    isLoading = true;
    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var decodedData = await jsonDecode(response.body);

        items =
            List.from(decodedData.map((data) => ProductModel.fromJson(data)));

        print(items.length);
        isLoading = false;
      }
    } catch (e) {
      error = e.toString();
    }
    notifyListeners();
  }
}
