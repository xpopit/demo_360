import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart';
import 'package:shoplive_mvp/cls/cls.dart' as cls;
import 'base_service.dart' as bs;

Map<String, dynamic> _responseToJson(Response _res) {
  try {
    if (_res.statusCode == 200) {
      return jsonDecode(_res.body);
    } else {
      return null;
    }
  } catch (exc) {
    print("Error: $exc");
    return null;
  }
}

class ApiService extends bs.BaseService {
  @override
  Future<Map> _getResponse(String param) async {
    try {
      return _responseToJson(await http.get(Uri.parse(param)));
    } catch (e) {
      cls.log.e(e.toString());
    }
  }
  // ignore: todo
  // TODO: implement FaceBook Graph Accounts

  Future<Map> getGFBAccounts(String token) async {
    return await _getResponse(
        '${baseUrlGraphFB}${fb_q_accounts}&access_token=${token}');
  }

  void Test(String token) {
    print('${baseUrlGraphFB}${fb_q_accounts}&access_token=${token}');
  }

  // @visibleForTesting
  // dynamic returnResponse(http.Response response) {
  //   switch (response.statusCode) {
  //     case 200:
  //       dynamic responseJson = jsonDecode(response.body);
  //       return responseJson;
  //     case 400:
  //       throw BadRequestException(response.body.toString());
  //     case 401:
  //     case 403:
  //       throw UnauthorisedException(response.body.toString());
  //     case 500:
  //     default:
  //       throw FetchDataException(
  //           'Error occured while communication with server' +
  //               ' with status code : ${response.statusCode}');
  //   }
  // }
  // Map resToJson(Response _res) {
  //   try {
  //     if (_res.statusCode == 200) {
  //       return convert.jsonDecode(_res.body);
  //     } else {
  //       return null;
  //     }
  //   } catch (exc) {
  //     print("Error: $exc");
  //     return null;
  //   }
  // }

// _showMessage('''
//  Logged in!
//  Token: ${accessToken.token}
//  User id: ${accessToken.userId}
//  Expires: ${accessToken.expires}
//  Permissions: ${accessToken.permissions}
//  Declined permissions: ${accessToken.declinedPermissions}
//  ''');
}
