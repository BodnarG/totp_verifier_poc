import 'dart:async';

import 'package:otp/otp.dart';
import 'package:totp_verifier_poc/controller/secure_storage_controller.dart';

class TOTPController {
  Future<String> getCode() async {
    SecureStorageController storageController = SecureStorageController();
    String? secret = await storageController.readTOTPSecret();
    if (secret == null) {
      throw Exception("Missing TOTP secret.");
    }
    return OTP.generateTOTPCodeString(secret, _getEpochTime(),
        algorithm: Algorithm.SHA1);
  }

  Future<bool> isValidTOTP({String? otp = ''}) async {
    return otp == await getCode();
  }

  int _getEpochTime() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}
