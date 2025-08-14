import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_tile.dart';

class ProductGrid extends StatefulWidget {
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    products = [
      Product(id:'1', title:'Apples', image:'', price:100, description:'Fresh apples'),
      Product(id:'2', title:'Bananas', image:'', price:50, description:'Ripe bananas'),
      Product(id:'3', title:'Milk', image:'', price:60, description:'Dairy milk'),
      Product(id:'4', title:'Bread', image:'', price:40, description:'Whole grain bread'),
      Product(id:'5', title:'Rice', image:'', price:120, description:'Basmati rice'),
      Product(id:'6', title:'Eggs', image:'', price:70, description:'Free-range eggs'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.72, crossAxisSpacing:8, mainAxisSpacing:8),
      itemCount: products.length,
      itemBuilder: (_,i) => ProductTile(product: products[i]),
    );
  }
}
