import 'package:assignment/classOfProducts.dart';
import 'package:flutter/material.dart';
import 'package:assignment/body_part.dart';
import 'package:assignment/login.dart';
import 'package:assignment/productAdd.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool isVerified = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => BodyPart(),
        '/home': (context) => BodyPart(),
        '/addProduct': (context) => isVerified ? AddProducts(onProductAdded: onProductAdded) : LoginPage(onSuccess: () {
              isVerified = true;
              Navigator.pushNamed(context, '/addProduct');
            }),
      },
    );
  }

  void onProductAdded(ProductClass product) {
    print('New product added: ${product.name}');
  }
}
