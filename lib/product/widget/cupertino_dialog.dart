import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          labelText: 'Password',
          errorText: showErrorText ? widget.invalidPasswordErrorText : null),
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
    return CupertinoAlertDialog(
      title: Text(AppTextConstants.logintitle),
      content: Card(
        color: Colors.transparent,
        elevation: 0.0,
        child: Column(
          children: [
            _buildEmailTextField(),
            _buildPasswordTextField(),
          ],
        ),
      ),
      actions: [
        CustomElevatedButton(),
      ],
    );
  }

  void _updateState() {
    setState(() {});
  }
}
