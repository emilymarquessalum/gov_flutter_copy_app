import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gov_flutter_copy_app/requests/request_status.dart';

class BackendResponse<T> {
  late RequestStatus statusCode;
  late dynamic message;
  late T data;

  BackendResponse(RequestStatus statusCode, dynamic message, T data) {
    this.statusCode = statusCode;
    this.message =message;
    this.data = data;
  }

  static BackendResponse<Map<String, dynamic>> fromResponse(Response response) {
    debugPrint("backend response");
    debugPrint(response.data.toString());
    debugPrint(response.data.runtimeType.toString());

    response.data ??= {};

    if (response.data is String) {
      try {
        response.data = jsonDecode(response.data);
      } catch (err) {

        return BackendResponse(RequestStatus.error, response.data, {});
      }
    }

    Map<String, dynamic>? responseData =
    _mapOf(response);

    String message ="";
    int statusCode = response.statusCode ?? 404;

    try {
      statusCode = int.tryParse(
          (responseData?["status"] ?? responseData?["statusCode"])
              .toString()) ??
          statusCode;
    } catch (err) {
    }

    debugPrint("inicialized status as " + statusCode.toString());
    debugPrint(responseData.toString());

    if (responseData is Map) {
      message = responseData?["message"] ?? "";
    }

    debugPrint("inicialized message");


    responseData = _mapOfData(responseData?["response"]) ?? responseData ?? {};


    debugPrint("inicialized data");

    debugPrint('finished backend response');

    return BackendResponse<Map<String, dynamic>>(
        RequestStatusExtension.fromInt(statusCode)
        , message,
        responseData as Map<String, dynamic>);
  }

  static Map<String, dynamic>? _mapOf(Response<dynamic> response) {

    return _mapOfData(response.data);
  }

  static _mapOfData(data) {
    if (data == null) {
      return null;
    }
    try {
      return Map<String, dynamic>.from(data);
    } catch (err) {
      return {"data": data};
    }
  }

  bool get positiveStatus => statusCode == RequestStatus.success;

  bool get isSystemFailure => statusCode == RequestStatus.error;



  static BackendResponse fromData(Map<String, dynamic> map) {
    return BackendResponse(RequestStatus.success, "", map);
  }

  static BackendResponse error() {
    return BackendResponse(RequestStatus.error, "", {});
  }

  static BackendResponse success({Map<String,dynamic>? data}) {
    return BackendResponse(RequestStatus.success, "", data ?? {});
  }
}

extension BackendResponseMapExtension on BackendResponse<Map<String, dynamic>> {

  String getErrorReport(
      {required String ifNoneFound, required List<String> expectedEntries}) {

    for (String entryKey in expectedEntries) {
      if ((data as Map).containsKey(entryKey)) {
        return data[entryKey];
      }
    }

    return ifNoneFound;
  }

}