import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:vonture_app/features/login/data/repos/login_repo.dart';
import 'package:vonture_app/features/login/data/repos/login_repo_implementation.dart';
import 'package:vonture_app/features/login/presentation/manager/login_cubit/login_cubit.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(
      Dio(),
    ),
  );
  getIt.registerLazySingleton<LoginRepoImplementation>(
      () => LoginRepoImplementation(apiService: getIt<ApiService>()));
  getIt.registerSingleton<LoginRepo>(
      LoginRepoImplementation(apiService: getIt<ApiService>()));

  // Register LoginCubit
  getIt.registerFactory(() => LoginCubit(getIt<LoginRepo>()));

  // getIt.registerSingleton<LoginRepo>(
  //   LoginRepoImplementation(
  //     apiService: getIt<ApiService>(),
  //   ),
  // );
  // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
}

Dio createAndSetupDIo() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = const Duration(milliseconds: 100000)
    ..options.receiveTimeout = const Duration(milliseconds: 100000);
  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    requestBody: true,
  ));
  return dio;
}
