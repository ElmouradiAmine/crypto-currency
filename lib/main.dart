import 'package:crypto_app/dependency_injection.dart';
import 'package:crypto_app/home.dart';
import 'package:flutter/material.dart';

void main() async {
  Injector.configure(Flavor.PROD);
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        
      ),
      home: MyHomePage(),
    );
  }
}
