import 'package:flutter/material.dart';
import 'package:mobile_seoul_soul/models/product.dart';

class Cart with ChangeNotifier {
  final List<CartProduct> _cart = [];

  List<CartProduct> get cartProducts => _cart;

  void clearCart() {
    _cart.clear();
  }

  void addProduct(Product product) {
    var found = false;

    _cart.asMap().forEach((index, p) {
      if (p.product == product) {
        _cart[index] = CartProduct(product, p.amount + 1);
        found = true;
        return;
      }
    });

    if (found == false) {
      _cart.add(CartProduct(product, 1));
    }
  }

  void removeProduct(CartProduct product) {
    _cart.remove(product);
  }
}

class CartProduct {
  final Product product;
  final int amount;

  CartProduct(this.product, this.amount);
}
