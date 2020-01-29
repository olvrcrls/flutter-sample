import 'package:flutter/material.dart';

class MessageList extends StatefulWidget {
  final String title;

  MessageList({Key key, this.title}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  var messages = const []; 
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
            var message = messages[index];
            return ListTile(
              isThreeLine: true,
              leading: CircleAvatar(
                child: Text('O'),
              ),
              title: Text(message['title']),
              subtitle: Text(
                message['body'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ));
  }
}
