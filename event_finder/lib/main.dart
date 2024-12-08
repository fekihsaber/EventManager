import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; 
import 'screens/event_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), 
      routes: {
        '/events': (context) => EventListScreen(), 
      },
    );
  }
}
