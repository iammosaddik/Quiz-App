import 'package:flutter/material.dart';

import 'neu_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isButtonPressed= false;
  void buttonPressed(){
    setState(() {
      if(isButtonPressed==false){
        isButtonPressed = true;
      }else if (isButtonPressed == true){
        isButtonPressed =false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(child: NeuButton(onTap: buttonPressed, isButtonPressed: isButtonPressed,)),
    );
  }
}
