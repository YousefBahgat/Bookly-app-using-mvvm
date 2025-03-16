//any failure that happens when getting data is added here..

import 'package:dio/dio.dart';

class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with the ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with the ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Send timeout with the ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(
            'Connection failed to the server due to bad Certificate!');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            dioException.response!.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled!');
      case DioExceptionType.connectionError:
        return ServerFailure(
            'There was a problem connecting to the server, Please try later!');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection!');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again!');
    }
  }

  factory ServerFailure.fromBadResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try  later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try  later!');
    } else {
      return ServerFailure('Opps There was an Error, Please try again!');
    }
  }
}
