import 'package:flutter/material.dart';
import 'package:tilapia_diseases/themes/colors.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  const TextInput(
      {super.key, required this.hintText, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: const Color(0xffF7F8F9),
        filled: true,
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: AppColor.greyColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.PrimaryColor),
        ),
      ),
    );
  }
}
