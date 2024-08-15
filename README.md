
# E-Commerce Flutter Application

## Overview

This project is a fully functional e-commerce application built using Flutter. The app allows users to browse products, add items to their cart, view their cart, and place orders. The app is designed with a clean and modern UI, providing a seamless shopping experience.

## Features

- **Product Listing**: Browse a list of products with images, names, and prices.
- **Product Details**: View detailed information about a product, including description, price, and image.
- **Add to Cart**: Users can add products to their cart and adjust the quantity.
- **Cart Management**: View items in the cart, update quantities, and remove items.
- **Order Placement**: Place an order, which leads to an order confirmation screen.
- **Navigation**: Easily navigate between the home screen, product details, cart, and order confirmation screens.
- **Custom Styling**: Black and white themed buttons, centered titles, and custom padding ensure a consistent and appealing UI.

## Project Structure

The project is organized as follows:

```plaintext
lib/
├── main.dart                    # Entry point of the application
├── models/
│   └── product.dart             # Product model
├── providers/
│   └── cart_provider.dart       # Provider for managing cart state
├── screens/
│   ├── home_screen.dart         # Home screen displaying the list of products
│   ├── product_detail_screen.dart # Screen displaying product details
│   ├── cart_screen.dart         # Screen displaying items in the cart
│   └── order_confirmation_screen.dart # Order confirmation screen
└── widgets/
    └── custom_button.dart       # Custom button widget for consistent styling
```

## Dependencies

This project utilizes the following packages:

- `provider`: State management for the cart.
- `fluttertoast`: To display toast notifications.
- `flutter/material.dart`: Core Flutter components for building the UI.

Make sure to add these dependencies to your `pubspec.yaml` file.

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0
  http: ^0.13.3
  shared_preferences: ^2.0.6
  hive: ^2.0.4
  hive_flutter: ^1.1.0
  fluttertoast: ^8.2.8
```

## Screenshots

### Home Screen UI
![Home Screen UI](https://github.com/user-attachments/assets/7f411d49-d692-4c6e-8d6f-7da58ca96385)

### Cart Screen UI
![Cart Screen UI](https://github.com/user-attachments/assets/de6dfc26-ad10-40d0-ad42-7b7920e6f699)

## Demo

### Demo Video
[Demo video](https://github.com/user-attachments/assets/5febe8c1-fe26-4294-bf3c-b172bfbe5b03)


## How to Run

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/ecommerce-flutter-app.git
   cd ecommerce-flutter-app
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the app:**

   ```bash
   flutter run
   ```

## Customization

### Changing the Theme

The app's color scheme is currently set to a black and white theme. To change the theme, update the `primarySwatch` in `main.dart` and modify the button styles in the custom button widget.

### Adding More Products

You can add more products by updating the product list in your data source. Modify the `Product` model as needed to include additional fields.
