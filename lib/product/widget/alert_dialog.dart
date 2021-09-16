import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticketapp/core/constants/text/text_constants.dart';
import 'package:ticketapp/product/service/validators.dart';

class ShowmeAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppTextConstants.logintitle),
      content: Text("content"),
    );
  }
}

