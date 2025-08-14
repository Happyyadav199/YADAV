import 'package:flutter/material.dart';
import 'home_tab.dart';
import '../assets/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1200), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeTab()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(child: Image.asset('assets/images/logo.png', width: 160)),
    );
  }
}
