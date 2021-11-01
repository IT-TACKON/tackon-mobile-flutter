import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tackon/data/local_storage/preferences.dart';
import 'package:tackon/data/repository/api.dart';
import 'package:tackon/utils/logger.dart';

class AuthRepository {
  final Preferences _prefs = Preferences();

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final FormData formData = FormData.fromMap({
      'email': email,
      'password': password,
    });

    try {
      final Response response = await httpClientAuth.post(
        '/login',
        data: formData,
      );

      logger.i('response login: ${response.data}');
      Map<String, dynamic> json = jsonDecode(response.data);

      if (json['status']) {
        _prefs.isAuthenticated = true;
        _prefs.authorizationCode = json['accessToken'];
      } else {
        return false;
      }
    } on DioError catch (e) {
      logger.e('error login: $e}');

      return false;
    } catch (err) {
      logger.e('unhandled error login: $err}');

      return false;
    }

    return true;
  }
}
