import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shopping_api/model/product.dart';

class Remoteservices {
  static var client = http.Client();

  static Future<List<Product>?> fetchproduct() async {
    var response = await client.get(
      Uri.parse(
          'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      log(jsonString);
      return productFromJson(jsonString);
    } else {
      // show error messaage
      return null;
    }
  }
}
