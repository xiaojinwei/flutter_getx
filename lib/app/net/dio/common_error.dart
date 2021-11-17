import 'package:dio/dio.dart';

class CommonError{
  static String? getErrorMsg(DioErrorType type,dynamic error){
    switch(type){
      case DioErrorType.connectTimeout:
        return 'connect timeout';
      case DioErrorType.sendTimeout:
        return 'send timeout';
      case DioErrorType.receiveTimeout:
        return 'receive timeout';
      case DioErrorType.response:
        return 'incorrect response';
      case DioErrorType.cancel:
        return 'request cancel';
      case DioErrorType.other:
        return error == null ? 'unknown error' : error.toString();
    }
  }
}