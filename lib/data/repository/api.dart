import 'package:dio/dio.dart';
import 'package:tackon/common/constant.dart';
import 'package:tackon/data/local_storage/preferences.dart';

final Preferences _prefs = Preferences();

Dio _dioClientAuth() {
  BaseOptions options = BaseOptions(
    baseUrl: baseURL,
    headers: {
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': 'true',
      'Access-Control-Allow-Credentials': true,
      'Access-Control-Allow-Headers':
          'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale',
      'Access-Control-Allow-Methods': 'POST, OPTIONS'
    },
  );

  Dio dio = Dio(options);

  return dio;
}

Dio httpClientAuth = _dioClientAuth();

Dio _dioClient() {
  BaseOptions options = BaseOptions(
    baseUrl: baseURL,
    headers: {
      'authorization': _prefs.authorizationCode,
    },
  );

  Dio dio = Dio(options);

  return dio;
}

Dio httpClient = _dioClient();
