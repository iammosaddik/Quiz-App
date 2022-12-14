import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_app/Style/app_color.dart';
import 'package:quiz_app/UI%20Page/Authentication/sign_in.dart';
import 'package:quiz_app/Widget/button_global.dart';
import 'package:quiz_app/Style/url_launcher.dart';

import '../../Repo/auth_repo.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  bool isButtonPressed= false;


  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


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
                // lottie animation start Code...........
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  child: Lottie.asset('images/signup1.json'),
                ),
                // lottie animation end Code................
                const SizedBox(height: 10,),
                // AppTextField start Code ...................
                GetTextField(
                  prefixIcon: const Icon(Icons.person,color: Colors.blue,),
                  hintText: 'First Name',
                  labelText: 'Enter Your First Name',
                   textFieldType: TextFieldType.NAME,
                  controller: firstNameController,
                ),
                const SizedBox(height: 10,),
                 GetTextField(
                  prefixIcon: const Icon(Icons.person,color: Colors.blue,),
                  hintText: 'Last Name',
                  labelText: 'Enter Your Last Name',
                   textFieldType: TextFieldType.NAME,
                  controller: lastNameController,
                ),
                const SizedBox(height: 10,),
                 GetTextField(
                  prefixIcon: const Icon(Icons.email_outlined,color: Colors.blue,),
                  hintText: 'Email',
                  labelText: 'Enter Your Email Address',
                   textFieldType: TextFieldType.EMAIL,
                   controller: emailController,
                ),
                const SizedBox(height: 10,),
                 GetTextField(
                  prefixIcon: const Icon(Icons.phone,color: Colors.blue,),
                  hintText: 'Phone Number',
                  labelText: 'Enter Your Phone Number',
                   textFieldType: TextFieldType.PHONE,
                   controller: phoneController,
                ),
                const SizedBox(height: 10,),
                 GetTextField(
                  prefixIcon: const Icon(Icons.lock,color: Colors.blue,),
                  hintText: 'Password',
                  labelText: 'Enter Your Password',
                   textFieldType: TextFieldType.PASSWORD,
                   controller: passwordController,
                ),
                const SizedBox(height: 10,),
                 GetTextField(
                  prefixIcon: const Icon(Icons.lock,color: Colors.blue,),
                  hintText: 'Password',
                  labelText: 'Enter Your Password',
                   textFieldType: TextFieldType.PASSWORD,
                   controller: confirmPasswordController,
                ),
                // AppTextField end Code .....................
                const SizedBox(height: 5,),
                // Sign Up start code .......................
                ButtonGlobal(
                    textButton: 'Sign Up',
                    buttonDecoration: myButtonDecoration.copyWith(color:isButtonPressed? Colors.black: Colors.white),
                    buttonTextColor:isButtonPressed ? Colors.white: AppColor.titleColor,
                    onPressed: ()
                      async {
                        if(emailController.text.isEmpty){
                          toast('Please Enter Your Email');
                        }else if(firstNameController.text.isEmpty){
                          toast('Please Enter Your First Name');
                        }else if(lastNameController.text.isEmpty){
                          toast('Please Enter Your Last Name');
                        }else if (phoneController.text.isEmpty){
                          toast('Please Enter Your Phone Number');
                        } else if(passwordController.text.isEmpty){
                          toast('Please Enter Your Password');
                        }else if(passwordController.text.length<6){
                          toast('Should be at lest 6 digit');
                        }else if(confirmPasswordController.text!=passwordController.text){
                          toast('Password Don\'t Match');
                        }else{
                          try{
                            EasyLoading.show(status: 'Signing Up...');
                            bool status = await AuthRepo().signUpWithEmail(firstNameController.text, lastNameController.text, emailController.text, phoneController.text,passwordController.text,confirmPasswordController.text);
                            if(status){
                              EasyLoading.showSuccess('Sign Up Successful');
                              const SignIn().launch(context,isNewTask: true);
                            }else{
                              EasyLoading.showError('Something went wrong please try again');
                            }
                          }catch(e){
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
                // Sign Up end code .......................
                const SizedBox(height: 5,),
                // Browser Link code start ...................
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
                // Browser Link code end ...................
                const SizedBox(height: 10,),
                //bottom code start here ...........
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?', style: TextStyle(color: Colors.grey,),),
                    const Text('LogIn Now',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),).onTap(()=> const SignIn().launch(context,isNewTask: true)),
                  ],
                )
                //bottom code end here ...........
              ],
            ),
          ),
        ),
      ),
    );
  }
}


