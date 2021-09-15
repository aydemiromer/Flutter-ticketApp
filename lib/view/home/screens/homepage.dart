import 'package:flutter/material.dart';
import 'package:ticketapp/core/constants/color/color_theme.dart';
import 'package:ticketapp/core/constants/text/text_constants.dart';
import 'package:ticketapp/core/style/text_styles.dart';
import 'package:ticketapp/product/widget/bottom_navigation.dart';
import 'package:ticketapp/product/widget/box_image.dart';
import 'package:ticketapp/core/extension/context_extension.dart';

class TicketHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationTool(),
      appBar: appbar,
      body: Padding(
        padding: context.paddingAllPage,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StackImage(),
            Text(AppTextConstants.homepagetime, style: AppTextStyles.titeStyle)
          ],
        ),
      ),
    );
  }
}

Widget get appbar => AppBar(
      backgroundColor: AppColor.primaryorange,
      leading: Icon(Icons.directions_bus),
      title: Text(AppTextConstants.title),
    );
