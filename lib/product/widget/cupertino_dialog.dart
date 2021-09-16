import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticketapp/core/constants/color/color_theme.dart';
import '../../core/constants/text/text_constants.dart';
import '../service/validators.dart';
import 'custom_sign_in_button.dart';

class ShowmeCupertinoDialog extends StatefulWidget
    with EmailAndPasswordValidators {
  @override
  _ShowmeCupertinoDialogState createState() => _ShowmeCupertinoDialogState();
}

class _ShowmeCupertinoDialogState extends State<ShowmeCupertinoDialog> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  bool _submitted = false;
  bool _isLoading = false;

  void _submit() async {
    setState(() {
      _submitted = true;
      _isLoading = true;
    });
  }

  void _emailEditingComplete() {
    final newFocus = widget.emailValidator.isValid(_email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  TextField _buildPasswordTextField() {
    bool showErrorText = _submitted &&
        !widget.passwordValidator.isValid(_password) &&
        !_isLoading;

    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
        enabled: _isLoading == false,
        hintText: 'Password',
        errorText: showErrorText ? widget.invalidPasswordErrorText : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
      ),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onChanged: (password) => _updateState(),
      onEditingComplete: _submit,
    );
  }

  TextField _buildEmailTextField() {
    bool showErrorText = _submitted && !widget.emailValidator.isValid(_email);
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        enabled: _isLoading == false,
        hintText: 'Email',
        errorText: showErrorText ? widget.invalidEmailErrorText : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: (email) => _updateState(),
      onEditingComplete: _emailEditingComplete,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Platform.isIOS
            ? CupertinoAlertDialog(
                title: Text(
                  AppTextConstants.logintitle,
                  style: TextStyle(fontSize: 24, color: AppColor.textColor),
                ),
                content: Card(
                  elevation: 0.0,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      _buildEmailTextField(),
                      SizedBox(
                        height: 24,
                      ),
                      _buildPasswordTextField(),
                      SizedBox(
                        height: 24,
                      ),
                      CustomElevatedButton(),
                    ],
                  ),
                ),
                actions: [],
              )
            : AlertDialog(
                title: Text(
                  AppTextConstants.logintitle,
                  style: TextStyle(fontSize: 24, color: AppColor.textColor),
                ),
                content: Card(
                  elevation: 0.0,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      _buildEmailTextField(),
                      SizedBox(
                        height: 24,
                      ),
                      _buildPasswordTextField(),
                      SizedBox(
                        height: 24,
                      ),
                      CustomElevatedButton(),
                    ],
                  ),
                ),
                actions: [],
              ));
  }

  void _updateState() {
    setState(() {});
  }
}
