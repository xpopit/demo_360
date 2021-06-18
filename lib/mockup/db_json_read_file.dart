import 'dart:convert';
import 'dart:io';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

String _path = 'assets/';

// Future<String> loadAsset() async {
//   return await rootBundle.loadString('assets/db_name.json');
// }

Future<Map<String, dynamic>> readJson(String db_name) async {
  try {
    String file = await rootBundle.loadString(_path + db_name); // (1)
    return json.decode(file);
  } catch (e) {
    print(e);
    return null;
  }
}
