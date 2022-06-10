import 'package:flutter/material.dart';

class OutlinedTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelText;
  final bool isMandatory;
  final String errorMessage;
  final int maxLength;
  final bool enabled;

  const OutlinedTextFormField(
      {required this.labelText,
        required this.controller,
        required this.keyboardType,
        this.isMandatory = false,
        this.errorMessage = 'This data is mandatory',
        this.maxLength = 30,
        this.enabled = true})
      : super();

  @override
  _OutlinedTextFormFieldState createState() => _OutlinedTextFormFieldState(
      controller,
      keyboardType,
      labelText,
      isMandatory,
      errorMessage,
      maxLength,
      enabled);
}

class _OutlinedTextFormFieldState extends State<OutlinedTextFormField> {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelText;
  final bool isMandatory;
  final String errorMessage;
  final int maxLength;
  final bool enabled;

  _OutlinedTextFormFieldState(this.controller, this.keyboardType,
      this.labelText, this.isMandatory, this.errorMessage, this.maxLength, this.enabled);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      maxLength: maxLength,
      keyboardType: keyboardType,
      minLines: 1,
      maxLines: keyboardType == TextInputType.multiline ? 3 : 1,
      decoration: InputDecoration(
        labelText: labelText + ((isMandatory) ? '*' : ''),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      validator: (String? value) {
        if (isMandatory && value!.isEmpty) {
          return errorMessage;
        }
        return null;
      },
      onSaved: (String? value) {
        controller.text = value!;
      },
    );
  }
}
