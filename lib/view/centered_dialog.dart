import 'package:flutter/material.dart';

class CenteredDialog extends StatefulWidget {
  final Widget body;

  const CenteredDialog({required Key key, required this.body})
      : super(key: key);

  @override
  _CenteredDialogState createState() => _CenteredDialogState(body);
}

class _CenteredDialogState extends State<CenteredDialog> {
  final Widget body;

  _CenteredDialogState(this.body);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: body,
      ),
    );
  }
}
