

class CreateRequest {
    CreateRequest({
        required this.userMail,
       required this.userPassword,
    });

    String userMail;
    String userPassword;

   
    Map<String, dynamic> toJson() => {
        "user_mail": userMail,
        "user_password": userPassword,
    };
}
