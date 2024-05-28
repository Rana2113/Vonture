import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vonture_app/core/colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.hinttext,
      this.isObscureText,
      this.suffixIcon,
      this.controller});
  final String hinttext;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hinttext,

          hintStyle: TextStyle(
            color: const Color(0xff96734F),
            fontSize: 16.sp,
            height: 0.09.h,
          ),
          // filled: true,
          // fillColor: Color(0xffFFFBF8),
          border: buildOutlineInputBorder(
            kBorderColor2,
          ),
          focusedBorder: buildOutlineInputBorder(
            kfocusborder,
          ),
          contentPadding: const EdgeInsets.all(20),
        ),
        obscureText: isObscureText ?? false,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(Color colorborder) {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: colorborder,
          width: 1.2.w,
        ),
        borderRadius: BorderRadius.circular(16));
  }
}
