// ignore_for_file: depend_on_referenced_packages

// import 'package:bettina_app/utils/widgets/loading_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class ApiServices {
  // Future<String?> fetchUrl(Uri uri, {Map<String, String>? headers}) async {
  //   try {
  //     final response = await http.get(uri, headers: headers);
  //     if (response.statusCode == 200) {
  //       return response.body;
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     debugPrint(uri.toString());
  //   }
  //   return null;
  // }

  getReq({String? endPoint, Map<String, dynamic>? headers, dynamic data}) async {
    try {
      // Make the POST request
      Dio dio = Dio();
      var response = await dio.get(
        endPoint!,
        options: Options(headers: headers ?? {}),
        data: data ?? {},
      );
      debugPrint("----->$response");
      return response;
      // Handle the response
    } catch (e) {
      // customPackageLoadingWidget(isLoading: false);
      // BotToast.closeAllLoading();
      debugPrint("get api res e====>$e");

      if (e is DioException) {
        if (e.response != null) {
          return e.response!;
        }
      } else {
        debugPrint("from api service e====>$e");

        rethrow;
      }
    }
  }

  postReq(
      {String? endPoint, Map<String, dynamic>? headers, dynamic data}) async {
    try {
      // Make the POST request
      Dio dio = Dio();
      // debugPrint("end--->${endPoint}");
      // debugPrint("end--->${headers}");
      // debugPrint("end--->${data}");
      var response = await dio.post(
        endPoint!,
        options: Options(headers: headers ?? {}),
        data: data ?? {},
      );
      debugPrint("dio from post====<${response.toString()}");
      return response;

      // Handle the response
    } catch (e) {
      debugPrint("post api res e====>$e");
      // customPackageLoadingWidget(isLoading: false);

      if (e is DioException) {
        debugPrint("post api res e====>${e.response}");
        debugPrint("post api res e====>${e.response}");
        debugPrint("post api res e====>${e.response!.statusMessage!}");
        debugPrint("post api res e====>${e.response!.data!}");

        if (e.response != null) {
          return e.response!;
        }
      } else {
        debugPrint("from api service e====>$e");
        rethrow;
      }
    }
  }

  putReq(
      {String? endPoint, Map<String, dynamic>? headers, dynamic data}) async {
    try {
      // Make the POST request
      Dio dio = Dio();
      var response = await dio.put(
        endPoint!,
        options: Options(headers: headers ?? {}),
        data: data ?? {},
      );
      debugPrint("dio from post====<${response.toString()}");
      return response;

      // Handle the response
    } catch (e) {
      debugPrint("post api res e====>$e");
      // customPackageLoadingWidget(isLoading: false);

      if (e is DioException) {
        if (e.response != null) {
          return e.response!;
        }
      } else {
        debugPrint("from api service e====>$e");
        rethrow;
      }
    }
  }

  deleteReq(
      {String? endPoint, Map<String, dynamic>? headers, dynamic data}) async {
    try {
      // Make the POST request
      Dio dio = Dio();
      var response = await dio.delete(
        endPoint!,
        options: Options(headers: headers ?? {}),
        data: data ?? {},
      );
      debugPrint("dio from post====<${response.toString()}");
      return response;

      // Handle the response
    } catch (e) {
      debugPrint("post api res e====>$e");
      // customPackageLoadingWidget(isLoading: false);

      if (e is DioException) {
        if (e.response != null) {
          return e.response!;
        }
      } else {
        debugPrint("from api service e====>$e");
        rethrow;
      }
    }
  }
}