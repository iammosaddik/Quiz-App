

import 'package:nb_utils/nb_utils.dart';

class DataBase{
    Future<String> getStringData (String key)async{
      SharedPreferences prefers = await SharedPreferences.getInstance();
      return prefers.getString('key') ?? '';
    }

    Future<bool> setStringData (String key,String data)async{
      SharedPreferences prefers = await SharedPreferences.getInstance();
     return prefers.setString(key, data);
    }
}