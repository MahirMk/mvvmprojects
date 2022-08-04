import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvvmprojects/providers/EmployeeProvider.dart';
import 'package:mvvmprojects/providers/ProductProvider.dart';
import 'package:mvvmprojects/views/auth/SplashScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => EmployeeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  SplashScreen(),
      ),
    );
  }
}

