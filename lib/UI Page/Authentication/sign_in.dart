import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_app/Repo/auth_repo.dart';
import 'package:quiz_app/Style/app_color.dart';
import 'package:quiz_app/UI%20Page/Authentication/sign_up.dart';
import 'package:quiz_app/Widget/button_global.dart';

import '../../../Style/url_launcher.dart';
import '../../Test/home_page.dart';
import 'forgot_password.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  bool rememberMe = false;
  bool isButtonPressed= false;


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              // lottie animation start Code....
             Container(
               alignment: Alignment.center,
               height: 300,
                 child: Lottie.asset('images/login.json'),
             ),
              // lottie animation end Code....
              const SizedBox(height: 20,),
               // ApptextField start Code ......
               GetTextField(
                prefixIcon: const Icon(Icons.email_outlined,color: Colors.blue,),
                hintText: 'Email',
                labelText: 'Enter Your Email', textFieldType: TextFieldType.EMAIL,
                 controller: emailController,
              ),
              const SizedBox(height: 20,),
               GetTextField(
                prefixIcon: const Icon(Icons.lock,color: Colors.blue,),
                hintText: 'Password',
                labelText: 'Enter Your Password', textFieldType: TextFieldType.PASSWORD,
                 controller: passwordController,
              ),
              // ApptextField end Code ......
              const SizedBox(height: 20,),
              // Remember me and forgot password start code ........
              Row(
                children: [
                  Checkbox(value: rememberMe, onChanged: (value) {
                    setState(() {
                      if(rememberMe==false){
                        rememberMe = true;
                      }else if (rememberMe == true){
                        rememberMe =false;
                      }
                    });
                  },),
                  const Text('Remember Me',style: TextStyle(color: AppColor.darkGreyColor,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                  const Spacer(),
                  GestureDetector(
                    onTap: ()=> const ForgorPassword().launch(context),
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: const Text('Forgot Password?',
                          style: TextStyle(
                              color: AppColor.darkGreyColor,fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.end,
                        )
                    ),
                  ),
                ],
              ),
              // Remember me and forgot password end code ........
              const SizedBox(height: 30,),
              // Sign In start code ...........
              ButtonGlobal(
                  textButton: 'Log In',
                  buttonDecoration: myButtonDecoration.copyWith(color:isButtonPressed? Colors.black: AppColor.buttonColor),
                  buttonTextColor:isButtonPressed ? Colors.white: AppColor.borderColor,
                  onPressed: () async {
                    if(emailController.text.isEmptyOrNull){
                      toast('Please Enter Your Email');
                    }else if (passwordController.text.isEmptyOrNull){
                      toast('Please Enter Your Correct Password');
                    }else{
                      try{
                        EasyLoading.show(status: 'Signing in ..');
                        bool status = await AuthRepo().signInWithEmail(emailController.text, passwordController.text);
                        if(status){
                          EasyLoading.showSuccess('Sign In SuccessFully');
                          const HomePage().launch(context,isNewTask: true);
                        }else{
                          EasyLoading.showError('Invalid Email Or Password');
                        }
                      }catch (e){
                        EasyLoading.showError(e.toString());
                      }
                    }
                    setState(() {
                      if(isButtonPressed==false){
                        isButtonPressed = true;
                      }else if (isButtonPressed == true){
                        isButtonPressed =false;
                      }
                    });
                  }),
              // Sign In start code ...........
              const SizedBox(height: 60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LinkButton(image: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(FontAwesomeIcons.facebookF, color: Colors.blue, size: 34,),
                  ),
                    buttonDecoration: myButtonDecoration.copyWith(color: Colors.white,
                    ),
                  ).onTap((){
                    UrlLauncher().launcheURL('www.facebook.com');
                  }),
                  const SizedBox(width: 8,),
                  LinkButton(image: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset("images/google.png"),
                  ),
                    buttonDecoration: myButtonDecoration.copyWith(color: Colors.white,
                    ),
                  ).onTap((){
                    UrlLauncher().launcheURL('www.google.com');
                  }),
                  const SizedBox(width: 8,),
                  LinkButton(
                    buttonDecoration: myButtonDecoration.copyWith(color: Colors.white,
                    ), image: const Icon(Icons.apple, color:AppColor.darkColor, size:44 ,),
                  ).onTap((){
                    UrlLauncher().launcheURL('www.apple.com');
                  }),
                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account yet?', style: TextStyle(color: Colors.grey,),),
                  const Text('Sign Up Here',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),).onTap(()=> const  SignUp().launch(context,isNewTask: Lottie.traceEnabled)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


