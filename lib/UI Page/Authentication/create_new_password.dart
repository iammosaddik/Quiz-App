import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_app/Style/app_color.dart';
import 'package:quiz_app/UI%20Page/Authentication/sign_in.dart';
import 'package:quiz_app/Widget/button_global.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {

  bool newPassword=false;
  bool alert = false;



  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


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
                child: Text('Create New Password',style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold),),
              ),
              Center(child: Lottie.asset('images/newpassword.json',height: 250)),
              const SizedBox(height: 70,),
              const Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                child: Text('Your new password must be unique from those previously used.', style: TextStyle(color: AppColor.darkGreyColor,fontSize: 16),textAlign: TextAlign.center,),
              ),
              const SizedBox(height: 20,),
               Padding(
                padding: EdgeInsets.only(left: 12.0,right: 12.0),
                child: GetTextField(
                  prefixIcon: Icon(Icons.lock,color: Colors.blue,),
                  hintText: 'Confirm Password',
                  labelText: 'Enter Your Confirm Password', textFieldType: TextFieldType.PASSWORD,
                  controller: emailController,
                ),
              ),
              const SizedBox(height: 10,),
               Padding(
                padding: EdgeInsets.only(left: 12.0,right: 12.0),
                child: GetTextField(
                  prefixIcon: Icon(Icons.lock,color: Colors.blue,),
                  hintText: 'Re-Enter Password',
                  labelText: 'Re-Enter Your Password', textFieldType: TextFieldType.PASSWORD,
                  controller: passwordController,
                ),
              ),
              const SizedBox(height: 20,),
              ButtonGlobal(
                  textButton: 'Reset Password',
                  buttonDecoration: myButtonDecoration.copyWith(color: newPassword? AppColor.buttonColor: Colors.green),
                  buttonTextColor:newPassword? Colors.white: Colors.white,
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (context)=> Container(
                          alignment: Alignment.topLeft,
                          child: AlertDialog(
                            alignment: Alignment.topLeft,
                            icon: Lottie.asset('images/success1.json'),
                            title: const Text('Password Changed Successfully', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold,fontSize: 20),),
                            actions: [
                              ButtonGlobal(
                                  textButton: ('Verify'),
                                  buttonDecoration: myButtonDecoration.copyWith(color:alert? Colors.red: Colors.green),
                                  buttonTextColor: AppColor.backgroundColor,
                                  onPressed: (){
                                    const SignIn().launch(context);
                                    setState(() {
                                      if(alert==false){
                                        alert = true;
                                      }else if(alert==true){
                                        alert= false;
                                      }
                                    });
                                  }),
                            ],
                          ),
                        )
                    );
                    setState(() {
                      if(newPassword==false){
                        newPassword = true;
                      }else if (newPassword == true){
                        newPassword =false;
                      }
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
