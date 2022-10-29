import 'dart:convert';


String otpRequestToJson(OtpRequest data) => json.encode(data.toJson());

class OtpRequest {
    OtpRequest({
        required this.userOtp,
        required this.id,
    });

    String userOtp;
    String id;

    

    Map<String, dynamic> toJson() => {
        "user_otp": userOtp,
        "_id": id,
    };
}
