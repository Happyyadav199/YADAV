import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../assets/colors.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  ProductDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen:false);
    return Scaffold(
      appBar: AppBar(title: Text(product.title), backgroundColor: primaryColor),
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.grey[200], child: product.image.isNotEmpty ? Image.network(product.image) : Center(child: Icon(Icons.local_grocery_store, size:80, color: primaryColor)))),
          Padding(padding: EdgeInsets.all(12), child: Text(product.description)),
          Padding(padding: EdgeInsets.symmetric(horizontal:12.0, vertical:8), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('₹${product.price.toStringAsFixed(0)}', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold)), ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: primaryColor), onPressed: (){ cart.add(product); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${product.title} added'))); }, child: Text('Add'))]))
        ],
      ),
    );
  }
}
