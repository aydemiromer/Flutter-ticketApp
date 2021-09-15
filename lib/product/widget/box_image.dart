import 'package:flutter/material.dart';
import 'package:ticketapp/core/constants/color/color_theme.dart';
import 'package:ticketapp/core/constants/image/image_constants.dart';
import 'package:ticketapp/core/constants/text/text_constants.dart';
import 'package:ticketapp/core/extension/context_extension.dart';
import 'package:ticketapp/core/style/text_styles.dart';

class StackImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.highValue * 2.5,
      child: Stack(
        children: [
          Padding(
            padding: context.paddingImage,
            child: Positioned(
              child: Container(
                width: context.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(ImageConstants.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Positioned(
              top: 175,
              left: 32,
              child: Text(
                AppTextConstants.imagetext,
                style: AppTextStyles.imageTextStyle,
              ))
        ],
      ),
    );
  }
}
