import 'package:flutter/material.dart';
import 'package:sample/models/Message.dart';

class MessageList extends StatefulWidget {
  final String title;

  MessageList({Key key, this.title}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  List<Message> messages = [];
  bool isLoading = true;

  Future loadMessageList() async {
    List<Message> _messages = await Message.browse();
    setState(() {
      messages = _messages;
      isLoading = false;
    });
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
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: messages.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
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
