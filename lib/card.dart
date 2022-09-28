import 'package:flutter/material.dart';

import 'item.dart';

class Cart with ChangeNotifier {
  List<Item> _items = [];
  double price = 0.0;

  void add(Item item) {
    _items.add(item);

    price += item.price;

    notifyListeners();
  }

  void remove(Item item) {
    _items.remove(item);

    price -= item.price;

    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return price;
  }

  List<Item> get itemContainer {
    return _items;
  }


}
