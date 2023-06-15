import 'dart:ffi';

import 'package:dio/dio.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  static String mainUrl = 'https://api-restfull-nodejs.onrender.com';
  var loginUrl = '$mainUrl/auth';
  var registerUrl = '$mainUrl/register';
  // final FlutterSecureStorage storage = const FlutterSecureStorage();
  final Dio _dio = Dio();

  // AndroidOptions _getAndroidOptions() => const AndroidOptions(
  //       encryptedSharedPreferences: true,
  //     );

  // Future<String?> hasToken() async {
  //   var value =
  //       await storage.read(key: 'token', aOptions: _getAndroidOptions());
  //   return value;
  // }

  // Future<void> getUser(String name) async {
  //   await storage.write(
  //       key: 'user', value: name, aOptions: _getAndroidOptions());
  // }

  // Future<void> persisteToken(String token) async {
  //   await storage.write(
  //       key: 'token', value: token, aOptions: _getAndroidOptions());
  // }

  Future<void> signOut() async {
    // storage.delete(key: 'token', aOptions: _getAndroidOptions());
    // storage.deleteAll();
  }

  Future<void> signIn({
    required Int callsign,
    required Int phone,
    required String password,
  }) async {
    try {
      var response = await _dio.post(loginUrl,
          data: {"callsign": callsign, "phone": phone, "password": password});
      // persisteToken(response.data['token']);
      // getUser(response.data.user.fullname);
      print(response.data);
      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signUp({
    required Int callsign,
    required Int phone,
    required Int numberZap,
  }) async {
    try {
      var response = await _dio.post(registerUrl, data: {
        "callsign": callsign,
        "phone": phone,
        "numberZap": numberZap,
      });
      return response.data;
      // return response.data[{'user', 'token'}];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> numberConfirmationBeforeSignup({
    required Int acessCode,
  }) async {
    try {
      var res = await _dio.post(registerUrl, data: {"acessCode": acessCode});
      return res.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> createPasswordBeforeSignup({
    required String password,
  }) async {
    try {
      var res = await _dio.post(registerUrl, data: {"password": password});
      return res.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signWithFacebook() async {
    try {
       
    } catch (e) {
      throw Exception(e); 
    }
  }
}
