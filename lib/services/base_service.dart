import 'dart:convert';

import 'package:http/http.dart';

class BaseService {
  final String baseUrlGraphFB = "https://graph.facebook.com/v10.0/";
  final String fb_q_accounts = 'me/accounts?fields=name,category,category_list';
  // ignore: unused_element
  Future<Map> _getResponse(String param) {}
}
