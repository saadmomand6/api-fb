import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:practice/Models/blog_models.dart';
import 'package:practice/utils/services/api_services.dart';
import 'package:practice/utils/snackbar.dart';

class BlogController extends GetxController {
  ApiServices apiServices = ApiServices();

  // final rxRequestStatus = Status.LOADING.obs;

  final blist = <BlogsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getblogs();
  }

  // void setrxRequestStatus(Status _value) => rxRequestStatus.value = _value;

   Future<List<dynamic>> getblogs() async {
    dynamic response = await apiServices.getReq(
      // headers: {
      //   'Authorization':
      //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Inhnd1l3TXV4aXdRdFNmbzRnOU9mMVdWQzl1ZjIiLCJmdWxsX25hbWUiOiJCZW4gUGFya2VyIiwicHJvZmlsZUltYWdlIjoiaHR0cHM6Ly9zdG9yYWdlLmdvb2dsZWFwaXMuY29tL2ZvcnRpZnktd2VsbG5lc3MtZmI2NzUuYXBwc3BvdC5jb20vcHJvZmlsZS1pbWFnZXMvMDZiNjQ2NjYtMmYxOC00ZmJiLWE2ODItYWYwODA1OTQ4MzNiLmpwZz9Hb29nbGVBY2Nlc3NJZD1maXJlYmFzZS1hZG1pbnNkay1kNjVtMyU0MGZvcnRpZnktd2VsbG5lc3MtZmI2NzUuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20mRXhwaXJlcz0zNDA4NzI4NzYwMCZTaWduYXR1cmU9Qkx1Z25kQ3BEMHNJNUslMkI0Tk54TktVUnZrJTJCSWtaNEFQYkt0OEM2bnd3RU9wOTRGd1liMm4lMkZ5Y0xUWU9PeWJObEZRb2ZKcWVWU3lHcHJoR0xJckczZ1hDUEdDNFNQSXV3bGVld242Y3RCQXFSJTJGaWpWcEkwTml6TVh4am9vc0J4NVNtREdWeEUlMkZMM2JaRVQ4N05pJTJGJTJCb24zSjZlTURadXglMkI5TG5xZ09nJTJGSHVJTEJqcGloZnBYc2xGU2ZudHlFaGNDeGkxb1hNWWN0dndtOEp0ejBXMENlUm5LNk1rdGx6VFJnQ25xZ2U1d092R2VpZzh3RXJlejRFaWglMkJ2Z3pyZmplb2t5QSUyRmQ1R2hOV3V6Zm00T01SdmNVWlBhJTJCYkJCeCUyQnRMMDduWlJpY3ZrSEJKakNtaGMzYjUzMVRUdGlkNFhkMFVXNkRFSHBJaVB0JTJGd1R0SnR3TSUyQmlRJTNEJTNEIiwiY29udGFjdCI6IjQyMTI4MTQzNTQ3MyIsImVtYWlsIjoiYmVuQGdtYWlsLmNvbSIsInJvbGUiOiJwcm9mZXNzaW9uYWwiLCJhYm91dCI6IkknbSBhIHByb2Zlc3Npb25hbCBmaXRuZXNzIGNvYWNoIGdyYWR1YXRlZCBmcm9tIG94Zm9yZCBpbiB5ZWFyIDIwMTgiLCJleHBlcmllbmNlIjoiNSIsImNhdGVnb3J5IjoiY29hY2hpbmciLCJzY2hlZHVsZSI6W3sidGltZXNsb3QiOlsiMDE6MDBQTS0wMjowMFBNIiwiMDM6MDBQTS0wNDowMFBNIiwiMDc6MDBQTS0wODowMFBNIl0sImRheSI6IlN1biJ9LHsidGltZXNsb3QiOlsiMDE6MDBQTS0wMlBNIiwiMDM6MDBQTS0wNFBNIl0sImRheSI6Ik1vbiJ9LHsidGltZXNsb3QiOlsiMDE6MDBQTS0wMjowMFBNIiwiMDM6MDBQTS0wNDowMFBNIiwiMDc6MDBQTS0wODowMFBNIl0sImRheSI6IlR1ZSJ9LHsidGltZXNsb3QiOlsiMTE6MzBBTS0xMjowMFBNIl0sImRheSI6IldlZCJ9LHsidGltZXNsb3QiOlsiMDE6MDBQTS0wMjowMFBNIiwiMDU6MDBQTS0wNjowMFBNIl0sImRheSI6IlRodSJ9LHsidGltZXNsb3QiOlsiMDc6MDBQTS0wODowMFBNIl0sImRheSI6IkZyaSJ9LHsidGltZXNsb3QiOlsiMTE6MDBBTS0xMjowMFBNIiwiMDE6MDBQTS0wMjowMFBNIl0sImRheSI6IlNhdCJ9XSwiaWF0IjoxNzA4NjQ2NjQxfQ.BWxd6YwWKVh9BQpxLd1YnyynxNlIE5aB0m-bT8WbvOI'
      // },
      endPoint: 'https://bruce-lms-server.vercel.app/api/practice-blogs',
    );
    // setrxRequestStatus(Status.COMPLETED);
    var getdata = response.data;
    if (getdata is List) {
      List<BlogsModel> parsedPatient =
          getdata.map((item) => BlogsModel.fromJson(item)).toList();
      blist.assignAll(parsedPatient);
    }
    return blist;
  }

  Future<void> postblog(
      dynamic data , BuildContext context) async {
    final response = await apiServices.putReq(
      // headers: {
      //   'Authorization':
      //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Inhnd1l3TXV4aXdRdFNmbzRnOU9mMVdWQzl1ZjIiLCJmdWxsX25hbWUiOiJCZW4gUGFya2VyIiwicHJvZmlsZUltYWdlIjoiaHR0cHM6Ly9zdG9yYWdlLmdvb2dsZWFwaXMuY29tL2ZvcnRpZnktd2VsbG5lc3MtZmI2NzUuYXBwc3BvdC5jb20vcHJvZmlsZS1pbWFnZXMvMDZiNjQ2NjYtMmYxOC00ZmJiLWE2ODItYWYwODA1OTQ4MzNiLmpwZz9Hb29nbGVBY2Nlc3NJZD1maXJlYmFzZS1hZG1pbnNkay1kNjVtMyU0MGZvcnRpZnktd2VsbG5lc3MtZmI2NzUuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20mRXhwaXJlcz0zNDA4NzI4NzYwMCZTaWduYXR1cmU9Qkx1Z25kQ3BEMHNJNUslMkI0Tk54TktVUnZrJTJCSWtaNEFQYkt0OEM2bnd3RU9wOTRGd1liMm4lMkZ5Y0xUWU9PeWJObEZRb2ZKcWVWU3lHcHJoR0xJckczZ1hDUEdDNFNQSXV3bGVld242Y3RCQXFSJTJGaWpWcEkwTml6TVh4am9vc0J4NVNtREdWeEUlMkZMM2JaRVQ4N05pJTJGJTJCb24zSjZlTURadXglMkI5TG5xZ09nJTJGSHVJTEJqcGloZnBYc2xGU2ZudHlFaGNDeGkxb1hNWWN0dndtOEp0ejBXMENlUm5LNk1rdGx6VFJnQ25xZ2U1d092R2VpZzh3RXJlejRFaWglMkJ2Z3pyZmplb2t5QSUyRmQ1R2hOV3V6Zm00T01SdmNVWlBhJTJCYkJCeCUyQnRMMDduWlJpY3ZrSEJKakNtaGMzYjUzMVRUdGlkNFhkMFVXNkRFSHBJaVB0JTJGd1R0SnR3TSUyQmlRJTNEJTNEIiwiY29udGFjdCI6IjQyMTI4MTQzNTQ3MyIsImVtYWlsIjoiYmVuQGdtYWlsLmNvbSIsInJvbGUiOiJwcm9mZXNzaW9uYWwiLCJhYm91dCI6IkknbSBhIHByb2Zlc3Npb25hbCBmaXRuZXNzIGNvYWNoIGdyYWR1YXRlZCBmcm9tIG94Zm9yZCBpbiB5ZWFyIDIwMTgiLCJleHBlcmllbmNlIjoiTkEiLCJjYXRlZ29yeSI6InRoZXJhcHkiLCJzY2hlZHVsZSI6W3sidGltZXNsb3QiOlsiMDE6MDBQTS0wMjowMFBNIiwiMDM6MDBQTS0wNDowMFBNIiwiMDc6MDBQTS0wODowMFBNIl0sImRheSI6IlN1biJ9LHsidGltZXNsb3QiOlsiMDE6MDBQTS0wMlBNIiwiMDM6MDBQTS0wNFBNIl0sImRheSI6Ik1vbiJ9LHsidGltZXNsb3QiOlsiMDE6MDBQTS0wMjowMFBNIiwiMDM6MDBQTS0wNDowMFBNIiwiMDc6MDBQTS0wODowMFBNIl0sImRheSI6IlR1ZSJ9LHsidGltZXNsb3QiOlsiMTE6MzBBTS0xMjowMFBNIl0sImRheSI6IldlZCJ9LHsidGltZXNsb3QiOlsiMDE6MDBQTS0wMjowMFBNIiwiMDU6MDBQTS0wNjowMFBNIl0sImRheSI6IlRodSJ9LHsidGltZXNsb3QiOlsiMDc6MDBQTS0wODowMFBNIl0sImRheSI6IkZyaSJ9LHsidGltZXNsb3QiOlsiMTE6MDBBTS0xMjowMFBNIiwiMDE6MDBQTS0wMjowMFBNIl0sImRheSI6IlNhdCJ9XSwiaWF0IjoxNzA5MTQwNDAyfQ.nJyX5FwpZNS4OqLT1ZPV_XiYOYYp5Z-JT9J7q9Q55HU'
      // },
      endPoint: 'https://bruce-lms-server.vercel.app/api/practice-blogs/add',
      data: data,
    );
    if (response.statusCode == 200) {
      getblogs();
      Utils.snackbar('Refresh the screen', 'by changing tab bar');
    }
  }
}
