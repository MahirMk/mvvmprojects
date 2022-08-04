import 'package:flutter/material.dart';

class ErrorPageEmployee extends StatefulWidget {

  @override
  State<ErrorPageEmployee> createState() => _ErrorPageEmployeeState();
}

class _ErrorPageEmployeeState extends State<ErrorPageEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 300,),
            Image.asset("img/error2.webp")
          ],
        ),
      ),
    );
  }
}
