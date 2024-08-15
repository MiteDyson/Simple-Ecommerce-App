import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<String, int> _cartItems = {}; // Stores product IDs and quantities
  final Map<String, Product> _products = {}; // Stores product details by ID

  Map<String, int> get cartItems => _cartItems;

  void addToCart(Product product) {
    if (_cartItems.containsKey(product.id)) {
      _cartItems[product.id] = _cartItems[product.id]! + 1;
    } else {
      _cartItems[product.id] = 1;
    }
    _products[product.id] = product; // Store product details
    notifyListeners();
  }

  void removeFromCart(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.remove(productId);
      _products.remove(productId); // Remove product details
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    _products.clear(); // Clear product details
    notifyListeners();
  }

  double get totalPrice {
    double total = 0.0;
    _cartItems.forEach((key, quantity) {
      final price = _products[key]?.price ??
          20.0; // Default price if product details are missing
      total += quantity * price;
    });
    return total;
  }

  Product? getProduct(String id) => _products[id];
}
