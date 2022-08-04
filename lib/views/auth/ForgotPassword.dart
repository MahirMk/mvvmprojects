import 'package:flutter/material.dart';
import 'package:mvvmprojects/resources/StyleResources.dart';

class ForgotPassword extends StatefulWidget {

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Center(
        child: Container(
          color: Colors.black,
            width: 200,
            height: 50,
            child: Center(child: Text("FORGOT PASSWORD",style: StyleResources.btntextstyle,))
        ),
      ),
    );
  }
}
