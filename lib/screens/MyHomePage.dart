import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  var messages = [
    'You won lottery',
    'You should read this message',
    'Another example message',
    'Hello there it\'s a message',
    'Yet another message for you'
  ]; // This should come from an API endpoint.


  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.separated(
          itemCount: messages.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index) {
            var title = messages[index];
            return ListTile(
              isThreeLine: true,
              leading: CircleAvatar(
                child: Text('O'),
              ),
              title: Text(title),
              subtitle: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi venenatis aliquam est, eu maximus enim malesuada at. Maecenas quis mattis justo. Maecenas sit amet odio magna.'),
            );
          },
        ));
  }
}
