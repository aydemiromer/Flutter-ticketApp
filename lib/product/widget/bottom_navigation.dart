import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ticketapp/core/constants/color/color_theme.dart';
import 'package:ticketapp/core/constants/text/text_constants.dart';
import 'package:ticketapp/product/widget/alert_dialog.dart';
import 'package:ticketapp/product/widget/cupertino_dialog.dart';

class BottomNavigationTool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home,
                    color: AppColor.primaryorange,
                  )),
              Text(AppTextConstants.bottomtext1)
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          if (!Platform.isIOS) {
                            return ShowmeAlertDialog();
                          } else {
                            return ShowmeCupertinoDialog();
                          }
                        });
                  },
                  icon: Icon(Icons.description)),
              Text(AppTextConstants.bottomtext2)
            ],
          ),
        ],
      ),
    );
  }
}
