import 'package:flutter/material.dart';
import 'package:mvvmprojects/views/auth/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../other/HomePage.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  checklogin() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("islogin"))
    {
      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>HomePage())
      );
    }
    else
    {
      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>Login())
      );
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      checklogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.pink.shade100,
        child: Center(
          child: Image.asset("img/mvvm.png",width: 300,),
        ),
      ),
    );
  }
}
