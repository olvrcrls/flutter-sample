import 'package:flutter/material.dart';
import 'package:sample/screens/MessageList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MessageList(title: 'E-mail App Practice'),
    );
  }
}