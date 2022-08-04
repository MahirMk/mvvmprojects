import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {

  TextEditingController controller;
  TextInputType keyboard;
  var ispassword=false;
  Widget icon;

  MyTextBox({this.controller,this.keyboard,this.ispassword,this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.blue,
        keyboardType: keyboard,
        obscureText: ispassword,
        decoration: InputDecoration(
          prefixIcon: icon,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3,color: Colors.blue),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
