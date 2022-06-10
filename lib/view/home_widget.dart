import 'package:flutter/material.dart';
import 'package:totp_verifier_poc/view/totp_verifier.dart';

import '../controller/secure_storage_controller.dart';
import 'centered_dialog.dart';
import 'configuration_view.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => _showConfigurationDialog(context),
        ),
      ]),
      body: const TOPVerifier(),
    );
  }

  void _showConfigurationDialog(BuildContext context) async {
    String secret = await SecureStorageController().readTOTPSecret() ?? '';

    await showDialog(
      context: context,
      builder: (_) {
        return CenteredDialog(
          body: ConfigurationForm(
            key: GlobalKey(),
            secret: secret,
            onSave: (_secret) async {
              await SecureStorageController().saveTOTPSecret(_secret);
            },
          ),
          key: GlobalKey(),
        );
      },
    );
  }
}
