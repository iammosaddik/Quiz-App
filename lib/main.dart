import 'package:flutter/material.dart';

import 'UI Page/Splash Screen/splash_screen.dart';

void main ()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: SplashScreen(),
    );
  }
}
