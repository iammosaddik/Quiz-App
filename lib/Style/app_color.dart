

import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor{
  static const Color mainColor = Color(0xFFFFEBAD);
  static const Color buttonColor = Color(0xFF2A3990);
  static const Color secondaryColor = Color(0xFF540375);
  static const Color titleColor = Color(0xFF181037);
  static const Color subTitleColor = Color(0xFF283A55);
  static const Color greyColor = Colors.grey;
  static const borderColor= Color(0xffE8ECF4);
  static const darkColor= Color(0xff1E232C);
  static const backgroundColor= Color(0xfff5f5f5);
  static const darkGreyColor= Color(0xff6A707C);
  static const greyColorDark= Color(0xff8391A1);
  static const primaryColor= Color(0xff35C2C1);
  static const whiteColor= Color(0xff35C2C1);
  static const subtitleColor =  Color(0xFF7c7c7c);

}


class ThemeColor {
  gradientColor (){
    const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xff226fff),
        Colors.redAccent,
        Colors.blue,
      ],
      stops: [
        0.1,
        0.3,
        0.5,
      ],
    );
  }
}



final myButtonDecoration =  BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(6,6),
            blurRadius: 15,
            spreadRadius: 1,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-6,-6),
            blurRadius: 15,
            spreadRadius: 1,
          ),
      ],
    gradient: ThemeColor().gradientColor(),
    color: AppColor.buttonColor,
    borderRadius: BorderRadius.circular(12) ,
    );
