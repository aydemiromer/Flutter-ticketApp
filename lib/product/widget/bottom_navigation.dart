import 'package:flutter/material.dart';
import 'package:ticketapp/core/constants/color/color_theme.dart';
import 'package:ticketapp/core/constants/text/text_constants.dart';

class BottomNavigationTool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: _bottomrow);
  }
}

Widget get _bottomrow => Row(
      crossAxisAlignment: CrossAxisAlignment.center,
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
            IconButton(onPressed: () {}, icon: Icon(Icons.description)),
            Text(AppTextConstants.bottomtext2)
          ],
        ),
      ],
    );
