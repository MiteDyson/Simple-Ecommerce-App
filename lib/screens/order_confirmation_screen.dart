import 'package:flutter/material.dart';
import '../screens/home_screen.dart'; // Import the home screen

class OrderConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Placed',
          textAlign: TextAlign.center, // Center align the text in the app bar
        ),
        backgroundColor: Colors.black, // Set AppBar background to black
        foregroundColor: Colors.white, // Set AppBar text color to white
        centerTitle: true, // Center the title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, color: Colors.green, size: 100),
            SizedBox(height: 16),
            Text(
              'Your order has been placed!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to the home screen and remove all previous routes
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black, // White text
                padding: EdgeInsets.symmetric(
                    vertical: 16, horizontal: 24), // Padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              child: Text('Continue Shopping'),
            ),
          ],
        ),
      ),
    );
  }
}
