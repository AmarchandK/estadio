import 'dart:convert';

OtpResponse otpResponseFromJson(String str) => OtpResponse.fromJson(json.decode(str));


class OtpResponse {
    OtpResponse({
        required this.status,
        required this.message,
        required this.token,
        required this.refreshToken,
    });

    bool status;
    String message;
    String token;
    String refreshToken;

    factory OtpResponse.fromJson(Map<String, dynamic> json) => OtpResponse(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        refreshToken: json["refreshToken"],
    );

    
}
