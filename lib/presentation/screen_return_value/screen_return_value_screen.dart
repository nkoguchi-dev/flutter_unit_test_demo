import 'package:flutter/material.dart';

class ScreenReturnValueScreen extends StatelessWidget {
  const ScreenReturnValueScreen({super.key, required this.returnValue});
  final String returnValue;

  void _handleOnPressed(BuildContext context) {
    Navigator.of(context).pop(returnValue);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const ValueKey('SubmitButton'),
      onPressed: () => _handleOnPressed(context),
      child: const SizedBox(),
    );
  }
}
