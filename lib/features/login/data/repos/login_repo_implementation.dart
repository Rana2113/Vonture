import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vonture_app/core/api_constants.dart';
import 'package:vonture_app/core/errors/failures.dart';
import 'package:vonture_app/core/models/user_model.dart';
import 'package:vonture_app/core/utils/api_service.dart';
import 'package:vonture_app/features/login/data/repos/login_repo.dart';

class LoginRepoImplementation implements LoginRepo {
  final ApiService apiService;
  LoginRepoImplementation({required this.apiService});

  @override
  Future<Either<Failure, UserModel>> login(
      String email, String password) async {
    try {
      final response = await apiService.post(
        endPoint: '/auth/login',
        data: {
          "email": email,
          "password": password,
        },
      );
      print("LoginRepo: API call successful - Response: $response");
      token = response["token"];
      kIdBox.put(kIdBoxString, response["user"]["_id"]);
      kTokenBox.put(kTokenBoxString, token);
      return Right(UserModel.fromJson(response["user"]));
    } catch (e) {
      print("LoginRepo: API call failed - Error: $e"); // Debug log

      if (e is DioException) {
        // print("Dioerror: ${e.response?.data}");
        return Left(
          ServerFailure.fromDioException(e),
        );
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
