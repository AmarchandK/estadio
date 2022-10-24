import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../../constants/colors.dart';
import '../../../controller/Authentication/login_controller.dart';

class Fields extends GetView<Authentication> {
  const Fields({
    Key? key,
    required this.cntrlr,
    required this.keybord,
    required this.hint,
    required this.validator,
    this.length,
    required this.icon,
    this.obscure,
    this.suffix,
  }) : super(key: key);

  final TextEditingController? cntrlr;
  final TextInputType keybord;
  final String hint;
  final String validator;
  final int? length;
  final IconData icon;
  final bool? obscure;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        height: 78,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validator;
            }

            return null;
          },
          controller: cntrlr,
          obscuringCharacter: '*',
          keyboardType: keybord,
          cursorColor: lightGreen,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: (hint == "Password" || hint == 'Confirm Password')
              ? controller.isObscure.value
              : false,
          maxLength: length,
          decoration: InputDecoration(
            suffixIcon: suffix,
            prefixIcon: Icon(icon),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: greyColor)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: lightGreen,
              ),
            ),
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
