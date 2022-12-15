import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_app/Style/app_color.dart';
import 'package:quiz_app/UI%20Page/Authentication/sign_in.dart';
import 'package:quiz_app/UI%20Page/Authentication/sign_up.dart';

import '../../../Widget/button_global.dart';

class WellComeScreen extends StatelessWidget {
  const WellComeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Lottie.asset('images/welcome4.json',height: 80),
              Lottie.asset('images/welcome1.json'),
              const SizedBox(height: 10,),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: AppColor.titleColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                       text: 'Please Sign Up Or Login\n '
                    ),
                    TextSpan(
                       text: 'To Continue',
                      style: TextStyle(
                        decoration: TextDecoration.underline
                      )
                    ),
                  ]
                ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 20,),
              ButtonGlobal(textButton: 'Sign In',
                buttonTextColor: Colors.white,
                buttonDecoration: myButtonDecoration,
                onPressed: (){
                const SignIn().launch(context);
                },
              ),
              const SizedBox(height: 30,),
              ButtonGlobal(textButton: 'Sign Up',
                buttonTextColor: AppColor.titleColor,
                buttonDecoration: myButtonDecoration.copyWith(color: Colors.white),
                onPressed: (){
                const SignUp().launch(context,isNewTask: true);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

