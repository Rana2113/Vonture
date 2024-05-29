import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vonture_app/core/colors.dart';
import 'package:vonture_app/core/errors/error_snakbar.dart';
import 'package:vonture_app/core/utils/app_router.dart';
import 'package:vonture_app/features/login/presentation/manager/login_cubit/login_cubit.dart';

class Loginbuttooon extends StatelessWidget {
  const Loginbuttooon({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          GoRouter.of(context).go(AppRouter.kHome);
        } else if (state is LoginFailure) {
          ShowSnakBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Center(
            child: CircularProgressIndicator(backgroundColor: Colors.red),
          );
        } else {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GestureDetector(
                onTap: onPressed,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kButtonColor,
                  ),
                  width: double.infinity,
                  height: 48.h,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 12.h),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          height: 0.11.h,
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        }
      },
    );
  }
}
