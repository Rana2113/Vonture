import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vonture_app/core/colors.dart';

// Widget defaultTextField({
//  required hintText,

// }) {};
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hinttext,
    this.isObscureText = false,
    this.suffixIcon,
    this.controller,
    required this.validator,
    this.onFieldSubmitted,
    required this.type,
  });
  final String hinttext;
  final TextInputType type;
  final bool isObscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function validator;
  final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        validator: (value) {
          return validator(value);
        },
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,

          hintText: hinttext,
          hintStyle: TextStyle(
            color: const Color(0xff96734F),
            fontSize: 16.sp,
            height: 0.09.h,
          ),
          border: buildOutlineInputBorder(
            kBorderColor2,
          ),
          focusedBorder: buildOutlineInputBorder(
            kFocusBorder,
          ),
          errorBorder: buildOutlineInputBorder(kErrorBorder),
          focusedErrorBorder: buildOutlineInputBorder(kErrorBorder),
          contentPadding: const EdgeInsets.all(20),
          filled: true,
          fillColor: kfillColor,
          // fillColor: const Color.fromARGB(255, 249, 239, 233),
        ),
        obscureText: isObscureText,
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
