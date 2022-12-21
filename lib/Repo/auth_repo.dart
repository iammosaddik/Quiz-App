
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:quiz_app/Model/Sign_up_model.dart';
import 'package:quiz_app/Config/config.dart';
import 'database.dart';

class AuthRepo {

  DataBase database = DataBase();


  //Sign In start .............
  Future<bool> signInWithEmail(String email, String password)async{
    var response = await http.post(Uri.parse(Config.serverUrl+Config.signInUrl),body: <String,String>{
      'email': email,
      'password': password,
    });
    var data = jsonDecode(response.body);
    if(response.statusCode==200){
      String token = data['data']['token'];
      print(token);
      return true;
    }else if(response.statusCode==400){
      throw Exception('Invalid Email Or Password');
    }else {
      throw Exception('Something went wrong ! please try again');
    }
  }
  //Sign In end .............


  //Sign Up start .............
  Future<bool> signUpWithEmail (String firstname,String lastname, String email, String phoneNumber, String password, String confirmPassword,) async {
    var response = await http.post(Uri.parse(Config.serverUrl+Config.signUpUrl),body: <String,String>{
      'name': firstname,
      'email': email,
      'phone': phoneNumber,
      'password': password,
    });
    var data = jsonDecode(response.body);
    if(response.statusCode==200){
      var decodedData =SignUpModel.fromJson(data);
      print(decodedData);
      return true;
    }else if(response.statusCode==422){
     throw Exception('The email Or Phone Number has already been taken');
    }else{
      throw Exception('Something went wrong ! please try again');
    }
  }
//Sign Up end .............



//Email verify code start .............
Future<bool> forGotPassword(String email) async {
    var response = await http.post(Uri.parse(Config.serverUrl+Config.forgotPasswordUrl),body: <String,String>{
      'email': email,
    });
    var data = jsonDecode(response.body);
    if(response.statusCode==200){
      print(data);
      return true;
    }else{
     throw Exception(e.toString());
    }
}
//Email verify code end .............



//Send Otp code start .............
Future<bool> getOtpResetCode(String code) async {
    var response = await http.post(Uri.parse(Config.serverUrl+Config.verifyResetCodeUrl),body: <String,String>{
      'code': code
    });

    var data = jsonDecode(response.body);
    if(response.statusCode==200){
      print(data);
      return true;
    }
    else {
      return throw Exception("Error");
    }
}
//Send Otp code end .............



//Send Reset Password code Started .............
Future<bool> getResetPassword(String code, String password, String passwordConfirmation) async {
    final response = await http.post(Uri.parse(Config.serverUrl+Config.resetPasswordUrl),body: <String,String>{
      'code': code,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });
    print(response.statusCode);
    var data = jsonDecode(response.body);
    if(response.statusCode==200){
      print(data);
      return true;
    }else{
      throw Exception('Failed , Please try again');
    }
}
//Send Reset Password code End .............



}