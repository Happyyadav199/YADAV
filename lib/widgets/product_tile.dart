import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_details.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../assets/colors.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen:false);
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetails(product: product))),
      child: Card(
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container(width: double.infinity, color: Colors.grey[100], child: product.image.isNotEmpty ? Image.network(product.image, fit: BoxFit.cover) : Center(child: Icon(Icons.local_grocery_store, size:48, color: primaryColor)))),
            Padding(padding: EdgeInsets.all(8), child: Text(product.title, style: TextStyle(fontWeight: FontWeight.w600))),
            Padding(padding: EdgeInsets.symmetric(horizontal:8.0), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('₹${product.price.toStringAsFixed(0)}', style: TextStyle(fontWeight: FontWeight.bold)), IconButton(icon: Icon(Icons.add_shopping_cart, color: primaryColor), onPressed: (){ cart.add(product); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${product.title} added'), duration: Duration(milliseconds:700))); })]))
          ],
        ),
      ),
    );
  }
}
