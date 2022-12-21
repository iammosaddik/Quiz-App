/// success : true
/// message : "Code Verification Successful!"

class OtpModels {
  OtpModels({
      bool? success, 
      String? message,}){
    _success = success;
    _message = message;
}

  OtpModels.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
  }
  bool? _success;
  String? _message;
OtpModels copyWith({  bool? success,
  String? message,
}) => OtpModels(  success: success ?? _success,
  message: message ?? _message,
);
  bool? get success => _success;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    return map;
  }

}