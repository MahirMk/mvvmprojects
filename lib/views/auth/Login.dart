import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mvvmprojects/resources/StyleResources.dart';
import 'package:mvvmprojects/views/auth/ForgotPassword.dart';
import 'package:mvvmprojects/views/other/HomePage.dart';
import 'package:mvvmprojects/widgets/MyPrimaryButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'RegisterScreen.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  FirebaseAuth auth = FirebaseAuth.instance;

  var displayName="";
  var email="";
  var photoURL="";
  var uid="";

  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();

  var txtname="";
  var txtpassword="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool _obscureText = true;

  String _pwd;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  _loginform()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 70.0),
        Center(child: Text("LOGIN",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),)),
        SizedBox(height: 70),
        Padding(
          padding: EdgeInsets.all(18.0),
          child: Text("Name"),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextFormField(
            controller: _name,
            cursorColor: Colors.green,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.drive_file_rename_outline),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3,color: Colors.red),
                borderRadius: BorderRadius.circular(10.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(18.0),
          child: Text("PassWord"),
        ),
        Padding(
          padding: EdgeInsets.all(18.0),
          child: TextFormField(
            validator: (val) => val.length < 6 ? 'Password too short.' : null,
            onSaved: (val) => _pwd = val,
            obscureText: _obscureText,
            controller: _password,
            cursorColor: Colors.green,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.all(18.0),
                child: GestureDetector(
                  onTap: _toggle,
                  child: Text(_obscureText ? "Show" : "Hide"),
                ),
              ),
              prefixIcon: Icon(Icons.password),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3,color: Colors.red),
                borderRadius: BorderRadius.circular(10.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>ForgotPassword())
            );
          },
              child: Text("Forgot Password",style: TextStyle(color: Colors.black,fontSize: 15),),
          ),
        ),
        SizedBox(height: 50.0,),
        Center(
          child: Container(
            color: StyleResources.btncolor,
            alignment: Alignment.center,
            height: 50,
            width: 300,
            // width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onTap: () async{
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>RegisterScreen())
                );
              },
              child: Text("Register",style: StyleResources.btntextstyle,),
            ),
          ),
        ),
        SizedBox(height: 20.0,),
        _loginbtn(),
        SizedBox(height: 30,),
        Center(child: Text("OR",style: TextStyle(fontSize: 30),)),
        SizedBox(height: 30,),
        _Googleloginbtn(),
      ],
    );
  }

  _loginbtn()
  {
    return MyPrimaryButton(
      onclick: () async {

        var nm = _name.text.toString();
        var pn = _password.text.toString();

        SharedPreferences prefs = await SharedPreferences.getInstance();

        var mainname = prefs.getString("name");
        var mainpassword = prefs.getString("password");

        if(nm==mainname && pn==mainpassword)
        {
          Fluttertoast.showToast(
              msg: "Your Contact And Password is True",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0
          );
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("Name", nm);

          prefs.setString("islogin", "yes");
          Navigator.of(context).pop();
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>HomePage())
          );
        }
        else
        {
          Fluttertoast.showToast(
              msg: "Your Email And Password is Incorrect",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      },
      width: 200.0,
      btntext: "Login",
    );
  }
  _Googleloginbtn()
  {
    return Container(
      child: MyPrimaryButton(
        onclick: () async {
      final GoogleSignIn googleSignIn = GoogleSignIn(
      );
      final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        // Getting users credential
        UserCredential result = await auth.signInWithCredential(authCredential);
        User user = result.user;

        var name = user.displayName.toString();
        var email = user.email.toString();
        var photo = user.photoURL.toString();
        var googleid = user.uid.toString();

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("Name", name);
        prefs.setString("Email", email );
        prefs.setString("Photo", photo);
        prefs.setString("Googleid", googleid);

        prefs.setString("islogin", "yes");

        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>HomePage())
        );
      }
        },
        width: 200.0,
        btntext: "Login With Google",
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: _loginform(),
      ),
    );
  }
}