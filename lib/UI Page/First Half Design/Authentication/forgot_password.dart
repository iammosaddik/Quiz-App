import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_app/Style/app_color.dart';
import 'package:quiz_app/Widget/button_global.dart';

import 'otp_verification.dart';

class ForgorPassword extends StatefulWidget {
  const ForgorPassword({Key? key}) : super(key: key);

  @override
  State<ForgorPassword> createState() => _ForgorPasswordState();
}

class _ForgorPasswordState extends State<ForgorPassword> {

  bool forgotClick= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new,color: Colors.blue,).onTap((){
          Navigator.pop(context);
        }),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text('Forgot Password?',style: TextStyle(color: AppColor.titleColor,fontWeight: FontWeight.bold,fontSize: 30),),
              ),
              const SizedBox(height: 20,),
              Lottie.asset('images/forgot.json'),
              const SizedBox(height: 30,),
              const Padding(
                padding: EdgeInsets.only(left: 12.0,right: 12.0),
                child: Text('Don\'t worry! It occurs. Please enter the email address linked with your account.',style: TextStyle(color: AppColor.darkGreyColor,fontSize: 16),textAlign: TextAlign.center,),
              ),
              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.only(left: 12.0,right: 12.0),
                child: GetTextField(
                  prefixIcon: Icon(Icons.email_outlined,color: Colors.blue,),
                  hintText: 'Email',
                  labelText: 'Enter Your Email', textFieldType: TextFieldType.EMAIL,
                ),
              ),
              const SizedBox(height: 20,),
              ButtonGlobal(
                  textButton: 'Sent Code',
                  buttonDecoration: myButtonDecoration.copyWith(color: forgotClick? AppColor.buttonColor: Colors.green),
                  buttonTextColor:forgotClick? Colors.white: Colors.white,
                  onPressed: (){
                    const Verification().launch(context);
                    setState(() {
                      if(forgotClick==false){
                        forgotClick = true;
                      }else if (forgotClick == true){
                      forgotClick =false;
                      }
                    });
              }),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          color: AppColor.greyColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text: 'Remember Password '
                          ),
                          TextSpan(
                              text: 'LogIn',
                              style: TextStyle(
                                color: Colors.blue,
                                  decoration: TextDecoration.underline
                              )
                          ),
                        ]
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
