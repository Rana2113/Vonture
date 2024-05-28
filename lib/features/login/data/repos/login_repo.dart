import 'package:vonture_app/core/errors/failures.dart';
import 'package:vonture_app/core/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserModel>> login(String email, String password);
}
