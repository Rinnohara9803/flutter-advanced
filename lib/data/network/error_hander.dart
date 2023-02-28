import 'package:dio/dio.dart';
import 'package:flutteradvanced/data/network/failure.dart';

import '../../presentation/resources/strings_manager.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  defaultCode,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
}

class ResponseCode {
  // API status codes
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no content
  static const int badRequest = 400; // failure, api rejected the request
  static const int forbidden = 403; // failure, api rejected the request
  static const int unauthorized = 401; // failure user is not authorised
  static const int notFound =
      404; // failure, api url is not correct and not found
  static const int internalServerError =
      500; // failure, crash happened in server side

  // local status code
  static const int defaultCode = -1;
  static const int connectTimeout = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
}

class ResponseMessage {
  // API status codes
  // API response codes
  static const String success = AppString.success; // success with data
  static const String noContent =
      AppString.noContent; // success with no content
  static const String badRequest =
      AppString.badRequestError; // failure, api rejected our request
  static const String forbidden =
      AppString.forbiddenError; // failure,  api rejected our request
  static const String unauthorized =
      AppString.unauthorizedError; // failure, user is not authorised
  static const String notFound = AppString
      .notFoundError; // failure, API url is not correct and not found in api side.
  static const String internalServerError =
      AppString.internalServerError; // failure, a crash happened in API side.

  // local responses codes
  static const String defaultCode =
      AppString.defaultError; // unknown error happened
  static const String connectTimeout =
      AppString.timeoutError; // issue in connectivity
  static const String cancel =
      AppString.defaultError; // API request was cancelled
  static const String receiveTimeout =
      AppString.timeoutError; //  issue in connectivity
  static const String sendTimeout =
      AppString.timeoutError; //  issue in connectivity
  static const String cacheError = AppString
      .defaultError; //  issue in getting data from local data source (cache)
  static const String noInternetConnection =
      AppString.noInternetError; // issue in connectivity
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);

      case DataSource.unauthorized:
        return Failure(ResponseCode.unauthorized, ResponseMessage.unauthorized);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataSource.defaultCode:
        return Failure(ResponseCode.defaultCode, ResponseMessage.defaultCode);
      case DataSource.connectTimeout:
        return Failure(
            ResponseCode.connectTimeout, ResponseMessage.connectTimeout);
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return Failure(
            ResponseCode.receiveTimeout, ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      default:
        return Failure(ResponseCode.defaultCode, ResponseMessage.defaultCode);
    }
  }
}

class ErrorHandlerImpl implements Exception {
  late Failure failure;
  ErrorHandlerImpl.handler(dynamic error) {
    if (error is DioError) {
      // handle dio-error (API response error)
      failure = _handleError(error);
    } else {
      failure = DataSource.defaultCode.getFailure();
    }
  }

  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return DataSource.connectTimeout.getFailure();

      case DioErrorType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioErrorType.badCertificate:
        return DataSource.defaultCode.getFailure();
      case DioErrorType.badResponse:
        switch (error.response!.statusCode) {
          case ResponseCode.badRequest:
            return DataSource.badRequest.getFailure();
          case ResponseCode.forbidden:
            return DataSource.forbidden.getFailure();
          case ResponseCode.unauthorized:
            return DataSource.unauthorized.getFailure();
          case ResponseCode.notFound:
            return DataSource.notFound.getFailure();
          case ResponseCode.internalServerError:
            return DataSource.internalServerError.getFailure();
        }
        break;
      case DioErrorType.cancel:
        return DataSource.cancel.getFailure();
      case DioErrorType.connectionError:
        return DataSource.connectTimeout.getFailure();
      case DioErrorType.unknown:
        return DataSource.defaultCode.getFailure();
      default:
        return DataSource.defaultCode.getFailure();
    }
  }
}
