import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../assets/colors.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final items = cart.items;
    return Scaffold(
      appBar: AppBar(title: Text('Cart'), backgroundColor: primaryColor),
      body: items.isEmpty ? Center(child: Text('Your cart is empty')) :
      Column(
        children: [
          Expanded(child: ListView.builder(itemCount: items.length, itemBuilder: (_,i) {
            final key = items.keys.elementAt(i);
            final qty = items[key]!;
            final product = cart.products[key]!;
            return ListTile(leading: CircleAvatar(child: Icon(Icons.shopping_bag, color: primaryColor)), title: Text(product.title), subtitle: Text('₹${product.price} x $qty'), trailing: Row(mainAxisSize: MainAxisSize.min, children: [IconButton(icon: Icon(Icons.remove), onPressed: () => cart.removeSingle(key))]));
          })),
          Padding(padding: EdgeInsets.all(12), child: Row(children: [Expanded(child: Text('Total: ₹${cart.total.toStringAsFixed(0)}', style: TextStyle(fontSize:18, fontWeight: FontWeight.bold))), ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: primaryColor), onPressed: (){ showDialog(context: context, builder: (_) => AlertDialog(title: Text('Checkout'), content: Text('Integrate payment & order API here.'), actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))])); }, child: Text('Checkout'))]))
        ],
      ),
    );
  }
}
