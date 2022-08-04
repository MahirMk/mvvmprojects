import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvmprojects/views/auth/Login.dart';
import 'package:mvvmprojects/views/employee/AddEmployee.dart';
import 'package:mvvmprojects/views/employee/ViewEmployee.dart';
import 'package:mvvmprojects/views/other/VerticalCard.dart';
import 'package:mvvmprojects/views/product/AddProduct.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../product/ViewProduct.dart';
class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var name="";

  getdata() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("Name");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Name : "+name,style: TextStyle(fontSize: 20.0,color: Colors.white),),
              ),
              GestureDetector(
                onTap: (){
                  AlertDialog alert = new AlertDialog(
                    title: Container(child: Text("Warning!",style: TextStyle(color: Colors.white),)),
                    backgroundColor: Colors.blue,
                    content: Text("Are you sure you want to delete record?",style: TextStyle(color: Colors.white)),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      },
                        child: Text("Cancel",style: TextStyle(color: Colors.white),),
                      ),
                      TextButton(
                        onPressed: () async{
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.clear();
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>Login())
                        );
                        Fluttertoast.showToast(
                            msg: "LogOut",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }, child: Text("LogOut",style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  );
                  showDialog(context: context, builder: (BuildContext context){
                    return alert;
                  });
                },
                child: Center(child:  Icon(Icons.logout_outlined)),
              ),
            ],
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.api),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.purple.shade50,
          child: ListView(
            children: [
              Image.asset("img/mvvm.png",width: 50,),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>AddProduct())
                    );
                  },
                  child: Container(
                      width: 220,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red,width: 2)
                      ),
                      child: Center(child: Text("ADD PRODUCT",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue.shade900),))
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>ViewProduct())
                    );
                  },
                  child: Container(
                      width: 220,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red,width: 2)
                      ),
                      child: Center(child: Text("VIEW PRODUCT",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue.shade900),))
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>AddEmployee())
                    );
                  },
                  child: Container(
                      width: 220,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red,width: 2)
                      ),
                      child: Center(child: Text("ADD EMPLOYEE",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue.shade900),))
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>ViewEmployee())
                    );
                  },
                  child: Container(
                      width: 220,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red,width: 2)
                      ),
                      child: Center(child: Text("VIEW EMPLOYEE",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue.shade900),))
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>VerticalCard())
            );
          }, child: Text("vertical_card_pager"))
        ],
      ),
    );
  }
}
