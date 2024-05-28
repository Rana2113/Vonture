import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vonture_app/core/utils/app_router.dart';
import 'package:vonture_app/features/splash/presentation/views/widgets/sliding_widgets.dart';

void main() {
  runApp(const SplashViewPage());
}

class SplashViewPage extends StatelessWidget {
  const SplashViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xffFFFBF8),
      ),
      home: const Splashiew(),
    );
  }
}

class Splashiew extends StatelessWidget {
  const Splashiew({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingImageAnimation;
  late Animation<Offset> slidingTextAnimation;
  Animation<Offset>? slidingVontureAnimation; // Make it nullable
  late Animation<double> opacityAnimation;
  bool slidingVontureInitialized = false;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateTo();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 1,
          ),
          SizedBox(
            width: screenWidth / 5.6,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return SlideTransition(
                  position: slidingImageAnimation,
                  child: FadeTransition(
                    opacity: opacityAnimation,
                    child: child,
                  ),
                );
              },
              child: const SlidingImage(),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Spacer(
                  flex: 1,
                ),
                SizedBox(
                  height: screenHeight / 18.9,
                  child: AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) {
                      if (slidingVontureAnimation == null) {
                        return const SizedBox(); // Return an empty SizedBox if animation is null
                      }
                      return SlideTransition(
                        position: slidingVontureAnimation!,
                        child: FadeTransition(
                          opacity: opacityAnimation,
                          child: child,
                        ),
                      );
                    },
                    child: const SlidingVonture(),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 130 / 375,
                  child: AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) {
                      return SlideTransition(
                        position: slidingTextAnimation,
                        child: FadeTransition(
                          opacity: opacityAnimation,
                          child: child,
                        ),
                      );
                    },
                    child: const SlidingText(),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    slidingImageAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(animationController);

    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        slidingVontureAnimation = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animationController);
        slidingVontureInitialized = true;
      });
    });

    slidingTextAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
            .animate(animationController);

    opacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);

    animationController.forward();
  }

  void navigateTo() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        GoRouter.of(context).push(AppRouter.kSignin);
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SplashViewBody extends StatefulWidget {
//   const SplashViewBody({super.key});

//   @override
//   State<SplashViewBody> createState() => _SplashViewBodyState();
// }

// class _SplashViewBodyState extends State<SplashViewBody>
//     with SingleTickerProviderStateMixin {
//   late AnimationController animationController;
//   late Animation<Offset> slidingImageAnimation;
//   late Animation<Offset> slidingTextAnimation;
//   Animation<Offset>? slidingVontureAnimation; // Make it nullable
//   late Animation<double> opacityAnimation;
//   bool slidingVontureInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     initSlidingAnimation();
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           const Spacer(
//             flex: 1,
//           ),
//           SizedBox(
//             width: 85.w,
//             child: AnimatedBuilder(
//               animation: animationController,
//               builder: (context, child) {
//                 return SlideTransition(
//                   position: slidingImageAnimation,
//                   child: FadeTransition(
//                     opacity: opacityAnimation,
//                     child: child,
//                   ),
//                 );
//               },
//               child: const SlidingImage(),
//             ),
//           ),
//           SizedBox(
//             width: 25.w,
//           ),
//           Expanded(
//             child: Column(
//               children: [
//                 const Spacer(
//                   flex: 1,
//                 ),
//                 SizedBox(
//                   height: 80.h,
//                   child: FittedBox(
//                     fit: BoxFit.fitHeight,
//                     child: AnimatedBuilder(
//                       animation: animationController,
//                       builder: (context, child) {
//                         if (slidingVontureAnimation == null) {
//                           return const SizedBox(); // Return an empty SizedBox if animation is null
//                         }
//                         return SlideTransition(
//                           position: slidingVontureAnimation!,
//                           child: FadeTransition(
//                             opacity: opacityAnimation,
//                             child: child,
//                           ),
//                         );
//                       },
//                       child: const SlidingVonture(),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 130.w,
//                   child: FittedBox(
//                     fit: BoxFit.scaleDown,
//                     child: AnimatedBuilder(
//                       animation: animationController,
//                       builder: (context, child) {
//                         return SlideTransition(
//                           position: slidingTextAnimation,
//                           child: FadeTransition(
//                             opacity: opacityAnimation,
//                             child: child,
//                           ),
//                         );
//                       },
//                       child: const SlidingText(),
//                     ),
//                   ),
//                 ),
//                 const Spacer(
//                   flex: 1,
//                 ),
//               ],
//             ),
//           ),
//           const Spacer(
//             flex: 1,
//           ),
//         ],
//       ),
//     );
//   }

//   void initSlidingAnimation() {
//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1500),
//     );

//     slidingImageAnimation =
//         Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
//             .animate(animationController);

//     Future.delayed(const Duration(milliseconds: 400), () {
//       setState(() {
//         slidingVontureAnimation = Tween<Offset>(
//           begin: const Offset(1, 0),
//           end: Offset.zero,
//         ).animate(animationController);
//         slidingVontureInitialized = true;
//       });
//     });

//     slidingTextAnimation =
//         Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
//             .animate(animationController);

//     opacityAnimation =
//         Tween<double>(begin: 0, end: 3).animate(animationController);

//     animationController.forward();
//   }
// }

// class SlidingText extends StatelessWidget {
//   const SlidingText({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // double width = MediaQuery.of(context).size.width;
//     return Center(
//       child: FittedBox(
//         fit: BoxFit.scaleDown,
//         child: Text(
//           'Travel With Purpose',
//           style: TextStyle(
//             color: const Color(0xffD79977),
//             fontSize: 20.sp,
//             // fontSize: 13,
//             // fontSize: width * 0.026,
//             fontWeight: FontWeight.w900,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }

// class SlidingImage extends StatelessWidget {
//   const SlidingImage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(
//         height: 150,
//         width: 100,
//         child: Image.asset('assets/BAG2.png'),
//       ),
//     );
//   }
// }

// class SlidingVonture extends StatelessWidget {
//   const SlidingVonture({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(
//         height: 90.h,
//         width: 170.w,
//         child:
//             FittedBox(fit: BoxFit.fill, child: Image.asset('assets/LOGO2.png')),
//       ),
//     );
//   }
// }
