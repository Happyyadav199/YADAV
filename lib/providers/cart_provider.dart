import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final Map<String,int> _items = {};
  final Map<String,Product> _products = {};

  Map<String,int> get items => _items;
  Map<String,Product> get products => _products;

  void add(Product p){
    _products[p.id]=p;
    _items[p.id] = (_items[p.id] ?? 0) + 1;
    notifyListeners();
  }

  void removeSingle(String id){
    if(!_items.containsKey(id)) return;
    if(_items[id]! > 1) _items[id] = _items[id]! -1;
    else { _items.remove(id); _products.remove(id); }
    notifyListeners();
  }

  double get total{
    double t=0;
    _items.forEach((id, qty){
      t += (_products[id]?.price ?? 0) * qty;
    });
    return t;
  }

  void clear(){ _items.clear(); _products.clear(); notifyListeners(); }
}
