/*
  ###################################
    Use this class for authentication api
  ###################################   
*/

// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:starter_app/api/base/api_core.dart';
// import 'package:starter_app/helper/api/api_route_helper.dart';
// import 'package:starter_app/helper/api/jwt_token_helper.dart';

// class ApiAuth {
//   ApiBaseCore apiBaseCore = ApiBaseCore();
//   Future<bool> login(String email, String password) async {
//     try {
//       Response? response = await apiBaseCore.postHTTP(
//           ApiRouteHelper.tokenPath, {"email": email, "password": password});
//       if (response == null) {
//         return false;
//       }
//       String accessToken = response.data["access"];
//       String refreshToken = response.data["refresh"];
//       log("Access token: $accessToken");
//       log("Refresh token: $refreshToken");
//       await JwtTokenHelper().saveNewJwtTokens(accessToken, refreshToken);
//       return true;
//     } on Exception {
//       return false;
//     }
//   }
// }
