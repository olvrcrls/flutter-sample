import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample/models/Message.dart';

class MessageList extends StatefulWidget {
  final String title;

  MessageList({Key key, this.title}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  List<Message> messages = const []; 

  Future loadMessageList() async {
    var apiUrl = "http://www.mocky.io/v2/5e3a8d522f00000b3c56c3d0";
    http.Response response = await http.get(apiUrl);
    String contents = response.body;
    List collection = json.decode(contents);
    List<Message> _messages = collection.map((json) => Message.fromJson(json)).toList();
    setState(() => messages = _messages);
  }

  @override
  void initState() {
    loadMessageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.separated(
          itemCount: messages.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index) {
            Message message = messages[index];
            return ListTile(
              isThreeLine: true,
              leading: CircleAvatar(
                child: Text('O'),
              ),
              title: Text(message.subject),
              subtitle: Text(
                message.body,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ));
  }
}
