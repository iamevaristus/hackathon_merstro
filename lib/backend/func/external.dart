import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:merstro/lib.dart';

const server = "http://merstro-server.herokuapp.com/endpoint";
const postUser = "http://merstro-server.herokuapp.com/post_user";
const getUser = "http://merstro-server.herokuapp.com/get_user";
const ipApiID = "696a44e4-acf9-456a-8608-f9d28c7b4774";
const ipSandbox = "https://sandbox.myidentitypass.com";

class Http{
  Http._privateConstructor();
  static final Http _instance = Http._privateConstructor();

  factory Http() {
    return _instance;
  }
}

abstract class ApiException implements Exception {}

class EmptyResultException extends ApiException {}

class ConnectionException extends ApiException {}

class ServerErrorException extends ApiException {}

class ClientErrorException extends ApiException {}

class UnknownException extends ApiException {}

Future<dynamic> getRequest(String path) async {
    http.Response response;

    try {
      response = await http.get(Uri.parse(path));
      final statusCode = response.statusCode;
      if (statusCode >= 200 && statusCode < 299) {
        if (response.body.isEmpty) {
          debugShow(List.filled(3, 0));
          return List.filled(3, 0);
        } else {
          debugShow(response.body);
          return jsonDecode(response.body);
        }
      } else if (statusCode >= 400 && statusCode < 500) {
        debugShow(statusCode.toString());
        throw ClientErrorException();
      } else if (statusCode >= 500 && statusCode < 600) {
        debugShow(statusCode.toString());
        throw ServerErrorException();
      } else {
        debugShow(statusCode.toString());
        throw UnknownException();
      }
    } on SocketException {
      throw ConnectionException();
    }
  }

class ExternalFunction{
  Future<CreateUser> postUser({
    required String path, required String email, required String firstName, required String lastName,
    required String phone, required String password, String? refCode
  }) async {
    final response = await http.post(
      Uri.parse(path),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'firstName': firstName,
        'lastName': lastName,
        'emailAddress': email,
        'phoneNumber': phone,
        'password': password,
        'refCode': refCode!
      }),
    );
    debugShow(response.body);
    if(response.statusCode == 201){
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      debugShow(response.body);
      return CreateUser.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      debugShow(response.body);
      throw Exception('Failed to create album.');
    }
  }
}

class BaseResponse <T> {
  bool status;
  String message;
  T? data;

  BaseResponse({required this.status, required this.message, required this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) build){
    return BaseResponse<T>(status: json["status"], message: json["message"], data: build(json["data"]));
  }
}

class BaseListResponse <T> {
  bool status;
  String message;
  List <T>? data;

  BaseListResponse({required this.status, required this.message, required this.data});

  factory BaseListResponse.fromJson(Map<String, dynamic> json, Function(List<dynamic>) build){
    return BaseListResponse<T>(status: json["status"], message: json["message"], data: build(json["data"]));
  }
}