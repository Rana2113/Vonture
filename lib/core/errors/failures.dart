import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessages;

  Failure(this.errorMessages);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessages);

  // ignore: empty_constructor_bodies
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Recieve timeout with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SoketEcxeption')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try later!');
      default:
        return ServerFailure('Opps there was an error, Please try later!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internet Server error, Please try later!');
    } else {
      return ServerFailure('Opps there was an error, Please try later!');
    }
  }
}
