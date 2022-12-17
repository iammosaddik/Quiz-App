
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_app/Model/Sign_in_model.dart';
import 'package:quiz_app/Model/Sign_up_model.dart';
import 'package:quiz_app/Repo/config.dart';

import 'database.dart';

class AuthRepo {

  DataBase database = DataBase();

  Future<bool> signInWithEmail(String email, String password)async{
    final prefers = await SharedPreferences.getInstance();
    var response = await http.post(Uri.parse(Config.serverUrl+Config.signInUrl),body: <String,String>{
      'email': email,
      'password': password,
    });
    var data = jsonDecode(response.body);
    if(response.statusCode==200){
      var decodedData = SignInModel.fromJson(data);
      await prefers.setString('access_token', decodedData.accessToken.toString());
      print(prefers.get('access_token'));
      return true;
    }else if(response.statusCode==400){
      throw Exception('Invalid Email Or Password');
    }else {
      throw Exception('Something went wrong ! please try again');
    }
  }


  Future<bool> signUpWithEmail (String firstname,String lastname, String email, String phoneNumber, String password, String confirmPassword,) async {
    final prefers =await SharedPreferences.getInstance();
    var response = await http.post(Uri.parse(Config.serverUrl+Config.signUpUrl),body: <String,String>{
      'first_name': firstname,
      'last_name': lastname,
      'email': email,
      'phone': phoneNumber,
      'password': phoneNumber,
      'password_confirmation': confirmPassword,
    });
    var data = jsonDecode(response.body);
    if(response.statusCode==201){
      var decodedData =SignInModel.fromJson(data);
      await prefers.setString('access_token', decodedData.accessToken.toString());
      print(prefers.get('access_token'));
      print(response.statusCode);
      return true;
    }else{
      throw Exception('User Have Exist');
    }
  }

}