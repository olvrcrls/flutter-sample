import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Title Text'),
            subtitle: Text('Subtitle Text'),
          );
        },
        itemCount: 10,
      )
    );
  }
}