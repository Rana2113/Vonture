import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vonture_app/core/Components/button.dart';
import 'package:vonture_app/core/Components/cusom_appbar.dart';
import 'package:vonture_app/core/Components/app_text_form_field.dart';
import 'package:vonture_app/core/Components/custom_image.dart';
import 'package:vonture_app/core/Components/spacing.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    // bool isObscureText = true;

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomAppBar(text: 'Sign In'),
            const CustomImage(image: 'assets/images/signin.png'),
            verticalSpacing(44),
            const AppTextField(hinttext: 'Email'),
            verticalSpacing(24),
            const AppTextField(hinttext: 'Password'),
            verticalSpacing(44),
            CustomButton(text: 'Log in', size: 16.sp, heigh: 48.h),
            verticalSpacing(16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: SizedBox(
                width: 386.w,
                height: 42.h,
                child: Text(
                  textAlign: TextAlign.center,
                  'By signing in, you agree to our Terms of Service and Privacy Policy',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff877563),
                    // height: 0.42.sp,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
                left: 16,
                right: 16,
              ),
              child: SizedBox(
                height: 70.h,
                child: const Text(
                  'Don\'t have an \n account?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                ),
              ),
            ),
            verticalSpacing(8),
            Text(
              'Join us and start your journey today.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                height: 0.09.h,
              ),
            ),
            verticalSpacing(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0.w),
              child: CustomButton(
                text: 'Create an account',
                size: 14.sp,
                heigh: 40.h,
              ),
            ),
            verticalSpacing(40),
          ],
        ),
      ),
    );
  }
}
