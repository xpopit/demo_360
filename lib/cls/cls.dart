import 'dart:convert';
import 'package:logger/logger.dart';

final Logger log = Logger(
    printer: PrettyPrinter(
        colors: false,
        errorMethodCount: 1,
        printEmojis: false,
        printTime: true,
        lineLength: 80,
        methodCount: 0));
bool isEmpty(String string) => (string.length == 0);
String prettyPrint(Map json) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}
