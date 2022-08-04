import 'package:flutter/material.dart';

class ErrorPageProduct extends StatefulWidget {

  @override
  State<ErrorPageProduct> createState() => _ErrorPageProductState();
}

class _ErrorPageProductState extends State<ErrorPageProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 300,),
          Image.asset("img/error2.webp")
        ],
      ),
    );
  }
}
