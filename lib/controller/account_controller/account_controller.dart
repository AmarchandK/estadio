// import 'dart:io';
// import 'dart:typed_data';

// import 'package:feedback/feedback.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
// import 'package:get/state_manager.dart';
// import 'package:path_provider/path_provider.dart';

// class AccountController extends GetxController{
//   _betterFeedback(context) {
//     BetterFeedback.of(context).show((UserFeedback feedback) async {
//       final screenShotFilePath = await writeImageToStorage(feedback.screenshot);
//       final Email email = Email(
//         body: feedback.text,
//         subject: 'Estadio Feedback',
//         recipients: ['amarchand00345@gmail.com'],
//         attachmentPaths: [screenShotFilePath],
//         isHTML: false,
//       );
//       await FlutterEmailSender.send(email);
//     });
//   }

//   Future<String> writeImageToStorage(Uint8List feedbackScreenshot) async {
//     final Directory output = await getTemporaryDirectory();
//     final String screenshotFilePath = '${output.path}/feedback.png';
//     final File screenShotFile = File(screenshotFilePath);
//     await screenShotFile.writeAsBytes(feedbackScreenshot);
//     return screenshotFilePath;
//   }


// }