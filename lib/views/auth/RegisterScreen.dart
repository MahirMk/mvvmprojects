import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvmprojects/widgets/MyTextBox.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/MyPrimaryButton.dart';

class RegisterScreen extends StatefulWidget {

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _contact = TextEditingController();

  var txtname="";
  var txtcontact="";
  var txtemail="";
  var txtpassword="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.0,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("Name"),
            ),
            MyTextBox(
              icon: Icon(Icons.drive_file_rename_outline),
              controller: _name,
              ispassword: false,
              keyboard: TextInputType.text,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("Email"),
            ),
            MyTextBox(
              icon: Icon(Icons.email),
              controller: _email,
              ispassword: false,
              keyboard: TextInputType.emailAddress,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("PassWord"),
            ),
            MyTextBox(
              icon: Icon(Icons.password),
              controller: _password,
              ispassword: true,
              keyboard: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("Contact"),
            ),
            MyTextBox(
              icon: Icon(Icons.contact_phone),
              controller: _contact,
              ispassword: false,
              keyboard: TextInputType.number,
            ),
            SizedBox(height: 50,),
            MyPrimaryButton(
              onclick: () async{

                var nm = _name.text.toString();
                var cn = _contact.text.toString();
                var en = _email.text.toString();
                var pn = _password.text.toString();

                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("name", nm);
                prefs.setString("contact", cn );
                prefs.setString("email", en);
                prefs.setString("password", pn);

                Navigator.of(context).pop();
                Fluttertoast.showToast(
                    msg: "Success Register",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );

              },
              width: 300,
              btntext: "Register",
            ),


          ],
        ),
      ),
    );
  }
}


// Center(
//   child: GestureDetector(
//     onTap: (){
//       Navigator.of(context).push(
//         MaterialPageRoute(builder: (context)=>Login())
//       );
//     },
//     child: Container(
//       width: MediaQuery.of(context).size.width,
//       height: 50.0,
//       color: StyleResources.btncolor,
//       alignment: Alignment.center,
//       child: Text("Register",style: StyleResources.btntextstyle,),
//     ),
//   ),
// ),