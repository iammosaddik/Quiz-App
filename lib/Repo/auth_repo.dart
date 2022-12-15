
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_app/Repo/config.dart';

import '../Model/Sign_model.dart';
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
      var decodedData = SignModel.fromJson(data);
      await prefers.setString('token', decodedData.accessToken.toString());
      print(prefers.get('token'));
      return true;
    }else if(response.statusCode==400){
      throw Exception('Invalid Email Or Password');
    }else {
      throw Exception('Something went wrong ! please try again');
    }
  }
}