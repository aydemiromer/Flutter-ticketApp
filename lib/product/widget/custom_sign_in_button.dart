import 'package:flutter/material.dart';
import 'package:ticketapp/core/constants/color/color_theme.dart';
import 'package:ticketapp/core/constants/text/text_constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final double borderRadius;
  final VoidCallback onPressed;

  const CustomElevatedButton(
      {Key key,
      this.borderRadius: 2.0,
      this.height: 60.0,
      this.width: 10.0,
      this.onPressed,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 60,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColor.primaryorange),
            shape: MaterialStateProperty.all<StadiumBorder>(
              StadiumBorder(
                  // borderRadius: BorderRadius.circular(borderRadius),
                  ),
            ),
          ),
          child: Text(
            AppTextConstants.button,
            style: TextStyle(color: AppColor.white),
          )),
    );
  }
}
