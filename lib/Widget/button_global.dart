import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Style/app_color.dart';



class ButtonGlobal extends StatelessWidget {
   ButtonGlobal({
    Key? key,
    required this.textButton,
    required this.buttonDecoration,
    required this.buttonTextColor,
    required this.onPressed,
  }) : super(key: key);

  final String textButton;
  final Decoration buttonDecoration;
  final Color buttonTextColor;
  var onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: double.infinity,
          decoration: buttonDecoration,
          child: Center(child: Text(textButton,style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: buttonTextColor),)),
        ),
      ),
    );
  }
}







//  OTP ButtonDesign start................
//  OTP ButtonDesign start................
//  OTP ButtonDesign start................

class LinkButton extends StatelessWidget {
  const LinkButton({
    Key? key,
    required this.buttonDecoration,  required this.image,
  }) : super(key: key);

  final Decoration buttonDecoration;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 56,
        width: 105,
        decoration: buttonDecoration,
        child: image,
      ),
    );
  }
}
//  OTP ButtonDesign start................
//  OTP ButtonDesign start................
//  OTP ButtonDesign start................







//  OTP TextField start................
//  OTP TextField start................
//  OTP TextField start................
class GetTextField extends StatelessWidget {
  const GetTextField({
    Key? key,
    required this.prefixIcon,
    required this.hintText,
    required this.labelText,
    required this.textFieldType,
  }) : super(key: key);

  final Icon prefixIcon;
  final String hintText;
  final String labelText;
  final TextFieldType textFieldType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myButtonDecoration.copyWith(color: Colors.white),
      child: AppTextField(
        textFieldType: textFieldType,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),
          ),enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
        ),
      ),
    );
  }
}
//  OTP TextField start................
//  OTP TextField start................
//  OTP TextField start................





//  OTP Verification start................
//  OTP Verification start................
//  OTP Verification start................
class OtpPage extends StatelessWidget {
  const OtpPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 68,
      child: AppTextField(textFieldType: TextFieldType.NUMBER,
        onChanged: (value){
          if(value.length==1){
            FocusScope.of(context).nextFocus();
          }
        },
        textStyle: const TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            )
        ),),
    );
  }
}
//  OTP Verification end................
//  OTP Verification end................
//  OTP Verification end................

