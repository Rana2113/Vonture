import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vonture_app/core/Components/button.dart';
import 'package:vonture_app/core/Components/cusom_appbar.dart';
import 'package:vonture_app/core/Components/app_text_form_field.dart';
import 'package:vonture_app/core/Components/custom_image.dart';
import 'package:vonture_app/core/Components/spacing.dart';
import 'package:vonture_app/core/utils/service_locator.dart';
import 'package:vonture_app/features/login/data/repos/login_repo_implementation.dart';
import 'package:vonture_app/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:vonture_app/features/login/presentation/views/widgets/button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    // bool isObscureText = true;

    return BlocProvider(
      create: (context) => LoginCubit(getIt<LoginRepoImplementation>()),
      child: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomAppBar(text: 'Sign In'),
                const CustomImage(image: 'assets/signin.png'),
                verticalSpacing(44),
                AppTextField(
                  hinttext: 'Email',
                  type: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    // if (!value.contains('@')) {
                    //   return 'Invalid email';
                    // }
                    return null;
                  },
                ),
                verticalSpacing(24),
                AppTextField(
                  hinttext: 'Password',
                  controller: passwordController,
                  type: TextInputType.visiblePassword,

                  // isObscureText: isObscureText,
                  // suffixIcon: IconButton(
                  //   icon: Icon(
                  //     isObscureText ? Icons.visibility_off : Icons.visibility,
                  //   ),
                  //   onPressed: () {
                  //     setState(() {
                  //       isObscureText = !isObscureText;
                  //     });
                  //   },
                  // ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                verticalSpacing(44),
                Loginbuttooon(
                  onPressed: () {
                    // print('pressed');
                    if (formKey.currentState!.validate()) {
                      LoginCubit.get(context).login(
                        emailController.text,
                        passwordController.text,
                      );
                    }
                  },
                ),
                // LoginButton(onPressed: () {
                //   // if (formKey.currentState!.validate()) {
                //   //   LoginCubit.get(context).login(
                //   //     emailController.text,
                //   //     passwordController.text,
                //   //   );
                //   // }
                // }),
                // CustomButton(text: 'Log in', size: 16.sp, heigh: 48.h),
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  ),
                ),
                verticalSpacing(40),
              ],
            ),
          ),
        );
      }),
    );
  }
}
