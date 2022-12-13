import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_app/Style/app_color.dart';
import 'package:quiz_app/UI%20Page/First%20Half%20Design/Authentication/sign_in.dart';
import 'package:quiz_app/Widget/button_global.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isButtonPressed= false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  child: Lottie.asset('images/signup1.json'),
                ),
                const SizedBox(height: 10,),
                const GetTextField(
                  prefixIcon: Icon(Icons.person,color: Colors.blue,),
                  hintText: 'First Name',
                  labelText: 'Enter Your First Name', textFieldType: TextFieldType.NAME,
                ),
                const SizedBox(height: 10,),
                const GetTextField(
                  prefixIcon: Icon(Icons.person,color: Colors.blue,),
                  hintText: 'Last Name',
                  labelText: 'Enter Your Last Name', textFieldType: TextFieldType.NAME,
                ),
                const SizedBox(height: 10,),
                const GetTextField(
                  prefixIcon: Icon(Icons.email_outlined,color: Colors.blue,),
                  hintText: 'Email',
                  labelText: 'Enter Your Email Address', textFieldType: TextFieldType.EMAIL,
                ),
                const SizedBox(height: 10,),
                const GetTextField(
                  prefixIcon: Icon(Icons.phone,color: Colors.blue,),
                  hintText: 'Phone Number',
                  labelText: 'Enter Your Phone Number', textFieldType: TextFieldType.PHONE,
                ),
                const SizedBox(height: 10,),
                const GetTextField(
                  prefixIcon: Icon(Icons.lock,color: Colors.blue,),
                  hintText: 'Password',
                  labelText: 'Enter Your Password', textFieldType: TextFieldType.PASSWORD,
                ),
                const SizedBox(height: 10,),
                const GetTextField(
                  prefixIcon: Icon(Icons.lock,color: Colors.blue,),
                  hintText: 'Password',
                  labelText: 'Enter Your Password', textFieldType: TextFieldType.PASSWORD,
                ),
                const SizedBox(height: 5,),
                ButtonGlobal(
                    textButton: 'Sign Up',
                    buttonDecoration: myButtonDecoration.copyWith(color:isButtonPressed? Colors.black: Colors.white),
                    buttonTextColor:isButtonPressed ? Colors.white: AppColor.titleColor,
                    onPressed: (){
                      setState(() {
                        if(isButtonPressed==false){
                          isButtonPressed = true;
                        }else if (isButtonPressed == true){
                          isButtonPressed =false;
                        }
                      });
                    }),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    LinkButton(image: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(FontAwesomeIcons.facebookF, color: Colors.blue, size: 34,),
                    ),
                      buttonDecoration: myButtonDecoration.copyWith(color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8,),
                    LinkButton(image: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset("images/google.png"),
                    ),
                      buttonDecoration: myButtonDecoration.copyWith(color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8,),
                    LinkButton(
                      buttonDecoration: myButtonDecoration.copyWith(color: Colors.white,
                      ), image: const Icon(Icons.apple, color:AppColor.darkColor, size:44 ,),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?', style: TextStyle(color: Colors.grey,),),
                    const Text('LogIn Now',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),).onTap(()=> const SignIn().launch(context,isNewTask: true)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


