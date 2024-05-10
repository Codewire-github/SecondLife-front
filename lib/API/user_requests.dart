import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:secondlife/API/route_addresses.dart';

class UserApiService {
  Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.76.225:8081"));
  // Future<bool> createUser() async {

  // dio.options.headers['Content-Type'] = 'application/json';

  // Map<String, dynamic>? loginData = {
  //   'username': emailAddress,
  //   'password': password,
  // };

  // try {
  //   Response response = await dio.post(
  //     userCreate,
  //     data: jsonEncode(userInfo.toJson()),
  //   );

  //   if (response.statusCode == 200) {
  //     debugPrint("User created Succesfully");
  //     return true;
  //   } else {
  //     print('Error creating user: ${response.statusCode}');

  //     return false;
  //   }
  // } catch (e) {
  //   debugPrint('Error creating user $e');
  //   return false;
  // }
}
