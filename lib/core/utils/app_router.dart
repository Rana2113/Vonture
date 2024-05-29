import 'package:go_router/go_router.dart';
import 'package:vonture_app/features/home/presentation/views/home_view.dart';
import 'package:vonture_app/features/login/presentation/views/login_view.dart';
import 'package:vonture_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHome = '/homeView';
  static const kSignin = '/login';
  static const kRegister = '/registerView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSignin,
        builder: (context, state) => const LogInView(),
      ),
      GoRoute(
        path: kHome,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
