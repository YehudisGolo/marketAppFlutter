import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopingItems = const [
    ["Avocado", "4.00", "lib/images/avocado.png", Colors.green],
    ["Banana", "2.50", "lib/images/banana.png", Colors.yellow],
    ["Chicken", "12.80", "lib/images/chicken.png", Colors.brown],
    ["Water", "1.00", "lib/images/water.png", Colors.blue]
  ];

  final List _cartItems = [];

  double _totalPrice = 0;

  CartModel(BuildContext context);

  List get cartItems => _cartItems;

  List get shopingItems => _shopingItems;

  double get totalPrice => _totalPrice;

// String get totalPrice => _totalPrice.toString();

  void addItemToCart(int index){
    _cartItems.add(_shopingItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calcolateTotal(){
    double totalPrice = 0;
    for(var item in cartItems){
      totalPrice += double.parse(item[1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}