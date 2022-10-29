import 'dart:convert';
LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));
class LoginResponse {
    LoginResponse({
       required this.status,
     required   this.message,
     required   this.token,
     required   this.refreshToken,
     required   this.id,
    });

    bool status;
    String message;
    String token;
    String refreshToken;
    String id;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        refreshToken: json["refreshToken"],
        id: json["_id"],
    );


}
