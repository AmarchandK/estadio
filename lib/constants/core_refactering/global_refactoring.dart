import 'dart:io';
import 'package:dio/dio.dart';
import 'package:estadio/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget mainHeadingText(text) => Padding(
    padding: const EdgeInsets.only(left: 18, top: 8),
    child: Row(
      children: [
        Text(
          text,
          style: GoogleFonts.baumans(
              color: lightGreen, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Expanded(
            child: Padding(
          padding: EdgeInsets.only(top: 6),
          child: Divider(
            color: wColor,
            thickness: 2,
            indent: 10,
          ),
        ))
      ],
    ));
Widget subTittle(String text) => Padding(
      padding: const EdgeInsets.all(7),
      child: Text(
        text,
        style: GoogleFonts.andika(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.lightGreen[300]),
      ),
    );
contentsText({required String text, double? size, Color? color}) => Text(
      text,
      style: GoogleFonts.andika(
          fontSize: size ?? 15,
          fontWeight: FontWeight.w600,
          color: color ?? Colors.grey[100]),
    );

SnackbarController showDialogue(tittle) {
  return Get.showSnackbar(
    GetSnackBar(
      messageText: Text(
        tittle,
        style: const TextStyle(color: redColor),
      ),
      icon: const Icon(CupertinoIcons.exclamationmark_shield),
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.transparent,
      barBlur: 10,
      dismissDirection: DismissDirection.horizontal,
      overlayBlur: 1,
      margin: const EdgeInsets.all(20.0),
      animationDuration: const Duration(seconds: 2),
      snackStyle: SnackStyle.GROUNDED,
      forwardAnimationCurve: Curves.bounceInOut,
      reverseAnimationCurve: Curves.bounceOut,
      borderColor: redColor,
      borderRadius: 10,
    ),
  );
}

showToast(message) {
  Fluttertoast.showToast(
      msg: message,
      fontSize: 20,
      textColor: lightGreen,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 3,
      gravity: ToastGravity.TOP,
      backgroundColor: bColor);
}

errorHandler(Object e) {
  if (e is DioError) {
    if (e.response!.data["status"] == false) {
      showToast(e.response!.data["message"]);
    } else if (e.response?.statusCode == 401) {
      showDialogue(e.response!.data["message"]);
    } else if (e.type == DioErrorType.connectTimeout) {
      showDialogue(e.response!.data["message"]);
    } else if (e.type == DioErrorType.receiveTimeout) {
      showDialogue(e.response!.data["message"]);
    } else if (e.type == DioErrorType.cancel) {
      showDialogue(e.response!.data["message"]);
    } else if (e.type == DioErrorType.sendTimeout) {
      showDialogue(e.response!.data["message"]);
    } else if (e.type == DioErrorType.response) {
      showDialogue(e.response!.data["message"]);
    } else if (e.type == DioErrorType.other) {
      showDialogue('Something went Wrong');
    }
  } else if (e is SocketException) {
    showDialogue(
      'No Internet Connection',
    );
  }
}

class UserSecureStorage {
  static const storage = FlutterSecureStorage();
  static const String tokenKey = 'tokenKey';
  static const String refreshKey = 'refreshKey';
  static const String userId = 'userId';
  static Future setTokens(String token, String refreshToken, String id) async {
    await storage.write(key: tokenKey, value: token);
    await storage.write(key: refreshKey, value: refreshToken);
    await storage.write(key: userId, value: id);
  }

  static Future getToken() async => await storage.read(key: tokenKey);
  static Future getrefreshToken() async => await storage.read(key: refreshKey);
  static Future getid() async => await storage.read(key: userId);
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}
