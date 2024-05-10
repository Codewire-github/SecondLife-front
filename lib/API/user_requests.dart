import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:secondlife/API/route_addresses.dart';
import 'package:secondlife/local_storage/const.dart';

class UserApiService {
  Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.76.225:8081"));

  Future<bool> createUser() async {
    dio.options.headers['Content-Type'] = 'application/json';
    String? username = await storage.read(key: name);
    String? emailAddress = await storage.read(key: email);
    String? avatarSelected = await storage.read(key: avatar);

    Map<String, dynamic>? loginData = {
      'email': emailAddress,
      'profile_picture': int.parse(avatarSelected!),
      'user_name': username,
    };

    try {
      Response response = await dio.post(
        userCreateURL,
        data: loginData,
      );

      if (response.statusCode == 200) {
        debugPrint("User created Succesfully");
        return true;
      } else {
        print('Error creating user: ${response.statusCode}');

        return false;
      }
    } catch (e) {
      debugPrint('Error creating user $e');
      return false;
    }
  }

  Future<List<dynamic>> getRecycleVideos(String detectedObject) async {
    dio.options.headers['Content-Type'] = 'application/json';
    Map<String, dynamic> loginData = {
      "objectDetected": detectedObject,
    };
    try {
      Response response = await dio.get(recyclingVideosURL, data: loginData);
      if (response.statusCode == 200) {
        debugPrint("${response.data}");
        return response.data;
      } else {
        print("Hello");
        return [];
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
