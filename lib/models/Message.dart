import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
part 'Message.g.dart';

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message({this.subject, this.body});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future<List<Message>> browse() async {
      var apiUrl = "http://www.mocky.io/v2/5e3a8d522f00000b3c56c3d0";
      http.Response response = await http.get(apiUrl);
      await Future.delayed(Duration(seconds: 2));
      String contents = response.body;
      List collection = json.decode(contents);
      List<Message> _messages =
          collection.map((json) => Message.fromJson(json)).toList();

      return _messages;
  } // browse
}
