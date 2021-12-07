import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthMethod {

  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e.toString());
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      return <BiometricType>[];
    }
  }

  static Future<bool> authenticate () async {

    final isAvaiable = await hasBiometrics();
    if (isAvaiable) return false;

    try {
    return await _auth.authenticate(
      localizedReason: 'Scan Fingerprint',
      useErrorDialogs: true,
      stickyAuth: true,
    );  
    } on PlatformException catch (e) {
      print(e.toString());
      return false;
    }
  }

}