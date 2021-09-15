import 'package:flutter/material.dart';
import 'package:ticketapp/view/home/screens/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ticketApp',
      home: TicketHomePage(),
    );
  }
}
