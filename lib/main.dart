import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketapp/core/constants/color/color_theme.dart';
import 'package:ticketapp/view/authenticate/provider/view_model.dart';
import 'package:ticketapp/view/home/screens/homepage.dart';

void main() => runApp(ChangeNotifierProvider<TicketDetailListViewModel>(
    create: (_) => TicketDetailListViewModel(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: AppColor.primaryorange),
        title: 'ticketApp',
        home: TicketHomePage());
  }
}
