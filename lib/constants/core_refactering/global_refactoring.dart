import 'dart:io';
import 'package:dio/dio.dart';
import 'package:estadio/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

Widget headingText(text) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: lightGreen),
      ),
    );
      Widget subTittle(String text) => Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
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
      showDialogue('Server not found !');
    } else if (e.type == DioErrorType.connectTimeout) {
      showDialogue('Connection Timout');
    } else if (e.type == DioErrorType.receiveTimeout) {
      showDialogue('Recieve Timout');
    } else if (e.type == DioErrorType.cancel) {
      showDialogue('Request cancelled');
    } else if (e.type == DioErrorType.sendTimeout) {
      showDialogue('Url  sent timeout');
    } else if (e.type == DioErrorType.response) {
      showDialogue('Incorrect status code, such as 404, 503...');
    } else if (e.type == DioErrorType.other) {
      showDialogue('Some other Error');
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
  static Future setTokens(String token, String refreshToken) async {
    await storage.write(key: tokenKey, value: token);
    await storage.write(key: refreshKey, value: refreshToken);
   
  }

  static Future getToken() async => await storage.readAll();
  static Future getrefreshToken() async => await storage.read(key: tokenKey);
}
