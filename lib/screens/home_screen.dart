import 'package:flutter/material.dart';
import 'product_grid.dart';
import '../assets/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Image.asset('assets/images/logo.png', width: 44),
                SizedBox(width: 8),
                Text('Groviq', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Spacer(),
                CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.person, color: primaryColor)),
              ],
            ),
          ),
          Expanded(child: ProductGrid()),
        ],
      ),
    );
  }
}
