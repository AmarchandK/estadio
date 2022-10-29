import 'package:estadio/controller/authentication/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import '../../../constants/colors.dart';

class OnTapButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  const OnTapButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Obx(
          () => ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 15,
                backgroundColor: lightGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: !Authentication.onTapLoading.value ? () {} : onTap,
              child: !Authentication.onTapLoading.value
                  ? const CupertinoActivityIndicator(
                      color: darkGreen,
                    )
                  : Text(
                      text,
                      style: const TextStyle(color: darkGreen),
                    )),
        ),
      ),
    );
  }
}
