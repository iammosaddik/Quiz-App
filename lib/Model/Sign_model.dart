

class SignModel {
  SignModel({
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

  SignModel.fromJson(dynamic json) {
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
    int? id,
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    dynamic verificationCode,
    dynamic verificationExpireAt,
    String? createdAt,
    String? updatedAt,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _phone = phone;
    _email = email;
    _verificationCode = verificationCode;
    _verificationExpireAt = verificationExpireAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _phone = json['phone'];
    _email = json['email'];
    _verificationCode = json['verification_code'];
    _verificationExpireAt = json['verification_expire_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _phone;
  String? _email;
  dynamic _verificationCode;
  dynamic _verificationExpireAt;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get phone => _phone;
  String? get email => _email;
  dynamic get verificationCode => _verificationCode;
  dynamic get verificationExpireAt => _verificationExpireAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['phone'] = _phone;
    map['email'] = _email;
    map['verification_code'] = _verificationCode;
    map['verification_expire_at'] = _verificationExpireAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}