import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutteradvanced/app/app_prefs.dart';
import 'package:flutteradvanced/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = 'application/json';
const String contentType = 'content-type';
const String accept = 'accept';
const String authorization = 'authorization';
const String defaultLanugage = 'language';

class DioFactory {
  AppPreferences appPreferences;
  DioFactory(this.appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    int timeOut = 60 * 1000; // 1 min of timeout
    Duration timeOutDuration = Duration(milliseconds: timeOut);
    String appLanguage = await appPreferences.getAppLanguage();
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization: Constants.token,
      defaultLanugage: appLanguage, // get language from app preferences
    };
    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      receiveTimeout: timeOutDuration,
      connectTimeout: timeOutDuration,
      headers: headers,
    );

    if (kReleaseMode) {
      print('no logs in release mode.');
    } else {
      dio.interceptors.add(
        PrettyDioLogger(
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        ),
      );
    }
    return dio;
  }
}
