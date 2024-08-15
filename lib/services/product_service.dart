import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    final response = await rootBundle.loadString('assets/products.json');
    final List<dynamic> data = jsonDecode(response);
    return data.map((json) => Product.fromJson(json)).toList();
  }
}
