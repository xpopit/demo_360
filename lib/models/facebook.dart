import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;

//     "https://graph.facebook.com/v2.2/oauth/access_token?client_id=$appId&redirect_uri=http://localhost:8080/&client_secret=$appSecret&code=$code"));
//   return new Token.fromMap(json.decode(response.body));
// }

class Token {
  final String access;
  final String type;
  final num expiresIn;

  Token(this.access, this.type, this.expiresIn);

  Token.fromMap(Map<String, dynamic> json)
      : access = json['access_token'],
        type = json['token_type'],
        expiresIn = json['expires_in'];
}

class Id {
  final String id;

  Id(this.id);
}

class Cover {
  final String id;
  final int offsetY;
  final String source;

  Cover(this.id, this.offsetY, this.source);

  Cover.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        offsetY = json['offset_y'],
        source = json['source'];
}

class PublicProfile extends Id {
  final Cover cover;
  final String name;
  PublicProfile.fromMap(Map<String, dynamic> json)
      : cover =
            json.containsKey('cover') ? new Cover.fromMap(json['cover']) : null,
        name = json['name'],
        super(json['id']);
}

// class FacebookGraph {
//   final String _baseGraphUrl = "https://graph.facebook.com/v2.8/";
//   final Token token;

//   FacebookGraph(this.token);

//   Future<PublicProfile> me(List<String> fields) async {
//     String _fields = fields.join(",");
//     final http.Response response = await http.get(Uri.parse(
//         "$_baseGraphUrl/me?fields=$_fields&access_token=${token.access}"));
//     return new PublicProfile.fromMap(json.decode(response.body));
//   }
// }
