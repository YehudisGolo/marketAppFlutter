import 'package:flutter/material.dart';
import 'package:market_app/model/cart_model.dart';
import 'package:provider/provider.dart';
import 'pages/intro_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (context) => CartModel(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroScreen(),
      ),
    );
  }
}
