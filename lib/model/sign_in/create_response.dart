import 'dart:convert';

CreateResponse createResponseFromJson(String str) =>
    CreateResponse.fromJson(json.decode(str));

class CreateResponse {
  CreateResponse({
    required this.status,
    required this.id,
    required this.message,
  });

  bool status;
  String id;
  String message;

  factory CreateResponse.fromJson(Map<String, dynamic> json) => CreateResponse(
        status: json["status"],
        id: json["id"],
        message: json["message"],
      );
}
