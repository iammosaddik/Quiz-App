

class SignUpModel {
  SignUpModel({
      String? status, 
      String? message, 
      User? user, 
      String? accessToken, 
      String? tokenType, 
      String? expiresAt,}){
    _status = status;
    _message = message;
    _user = user;
    _accessToken = accessToken;
    _tokenType = tokenType;
    _expiresAt = expiresAt;
}

  SignUpModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _expiresAt = json['expires_at'];
  }
  String? _status;
  String? _message;
  User? _user;
  String? _accessToken;
  String? _tokenType;
  String? _expiresAt;

  String? get status => _status;
  String? get message => _message;
  User? get user => _user;
  String? get accessToken => _accessToken;
  String? get tokenType => _tokenType;
  String? get expiresAt => _expiresAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    map['expires_at'] = _expiresAt;
    return map;
  }

}

class User {
  User({
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    String? updatedAt,
    String? createdAt,
    int? id,}){
    _firstName = firstName;
    _lastName = lastName;
    _phone = phone;
    _email = email;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
  }

  User.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _phone = json['phone'];
    _email = json['email'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _firstName;
  String? _lastName;
  String? _phone;
  String? _email;
  String? _updatedAt;
  String? _createdAt;
  int? _id;

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get phone => _phone;
  String? get email => _email;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['phone'] = _phone;
    map['email'] = _email;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}