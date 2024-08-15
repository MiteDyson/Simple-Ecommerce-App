import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    bool isInCart = cartProvider.cartItems.containsKey(widget.product.id);

    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(widget.product.imageUrl),
            SizedBox(height: 16),
            Text(widget.product.name, style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text('\$${widget.product.price}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text(widget.product.description),
            Spacer(),
            isInCart
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white, width: 2), // White border
                          color: Colors.black, // Black background
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove,
                                  color: Colors.white), // White icon
                              onPressed: () {
                                setState(() {
                                  if (quantity > 1) {
                                    quantity--;
                                    cartProvider.addToCart(widget.product);
                                  } else {
                                    cartProvider
                                        .removeFromCart(widget.product.id);
                                  }
                                });
                              },
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                '$quantity',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white), // White text
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add,
                                  color: Colors.white), // White icon
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                  cartProvider.addToCart(widget.product);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: () {
                      // Add the product to the cart with the specified quantity
                      cartProvider.addToCart(widget.product);
                      setState(() {});

                      // Display a toast notification
                      Fluttertoast.showToast(
                        msg: "Item added to cart!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black, // White text
                      side: BorderSide(
                          color: Colors.white, width: 2), // White border
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 16, horizontal: 32), // Padding
                    ),
                    child: Text('Add to Cart'),
                  ),
          ],
        ),
      ),
    );
  }
}
