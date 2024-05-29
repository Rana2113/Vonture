import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vonture_app/core/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.size,
      required this.heigh,
      required this.onPressed});
  final String text;
  final double size, heigh;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kButtonColor,
          ),
          width: double.infinity,
          height: heigh,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: size,
                    fontWeight: FontWeight.w700,
                    height: 0.11.h),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
