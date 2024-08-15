import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'order_confirmation_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: cartProvider.cartItems.isEmpty
          ? Center(child: Text('No items in your cart'))
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: cartProvider.cartItems.length,
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey[300], // Divider color
                      thickness: 1, // Divider thickness
                    ),
                    itemBuilder: (context, index) {
                      final productId =
                          cartProvider.cartItems.keys.toList()[index];
                      final quantity = cartProvider.cartItems[productId]!;
                      final product = cartProvider.getProduct(productId);

                      return ListTile(
                        title: Text(product?.name ?? 'Unknown Product'),
                        subtitle: Text('Quantity: $quantity'),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            cartProvider.removeFromCart(productId);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Total: \$${cartProvider.totalPrice}'),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (cartProvider.cartItems.isNotEmpty) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => OrderConfirmationScreen(),
                              ),
                            );
                            cartProvider.clearCart();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('No items in your cart')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black, // White text
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8), // Rounded corners
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 16), // Padding
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Place Order'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
