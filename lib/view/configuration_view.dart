import 'package:flutter/material.dart';

import 'outlined_text_form_field.dart';

class ConfigurationForm extends StatefulWidget {
  final String secret;
  final Function onSave;

  const ConfigurationForm(
      {Key? key, required this.secret, required this.onSave})
      : super(key: key);

  @override
  _ConfigurationFormState createState() =>
      _ConfigurationFormState(onSave, secret);
}

class _ConfigurationFormState extends State<ConfigurationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String secret;
  final Function onSave;

  late TextEditingController secretController;

  _ConfigurationFormState(this.onSave, this.secret);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    secretController = TextEditingController(text: secret);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OutlinedTextFormField(
            controller: secretController,
            keyboardType: TextInputType.text,
            labelText: 'Secret',
            isMandatory: true,
            maxLength: 99,
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xFF545458),
              ),
            ),
            onPressed: () async {
              if (!_formKey.currentState!.validate()) {
                return;
              }

              _formKey.currentState!.save();

              onSave.call(secretController.text);

              Navigator.pop(context);
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
