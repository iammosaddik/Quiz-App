import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'UI Page/Splash Screen/splash_screen.dart';


void main ()=> runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: SplashScreen(),
     builder: EasyLoading.init(),
    );
  }
}
