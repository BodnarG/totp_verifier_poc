import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:totp_verifier_poc/controller/totp_controller.dart';

class TOPVerifier extends StatefulWidget {
  const TOPVerifier({Key? key}) : super(key: key);

  @override
  State<TOPVerifier> createState() => _TOPVerifierState();
}

class _TOPVerifierState extends State<TOPVerifier> {
  late TextEditingController totpController;

  @override
  Widget build(BuildContext context) {
    totpController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(200.0),
        child: Center(
          child: Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: totpController,
                  ),
                ),
              ),
              OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xFF575759),
                  ),
                ),
                onPressed: () async {
                  bool isValid = await TOTPController()
                      .isValidTOTP(otp: totpController.text);
                  String validOTP = await TOTPController().getCode();

                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(isValid
                            ? 'Valid OTP'
                            : 'Invalid OTP. The valid code is $validOTP'),
                      );
                    },
                  );
                },
                child: const Text('Verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    totpController.dispose();
    super.dispose();
  }
}
