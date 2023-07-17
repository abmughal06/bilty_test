import 'package:bilty/screens/auth/otp_view.dart';
import 'package:bilty/screens/auth/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/widgets/alert_dialog.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // var authState = '';
  String verificationID = '';

  Stream<User?> get authState => FirebaseAuth.instance.idTokenChanges();

  void loginWithPhone(String? phoneNumber, context) async {
    try {
      _isLoading = true;
      notifyListeners();
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(
            credential,
          )
              .then((value) {
            Get.to(
              OTPView(
                verificationId: verificationID,
              ),
            );
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                // return const Text('Sign In failed');
                return CustomAlertDialog(
                  title: 'Sign in Failed',
                  message: e.toString(),
                  btnText: 'Got it',
                );
              },
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomAlertDialog(
                  title: 'Sign in Failed',
                  message: e.toString(),
                  btnText: 'Got it',
                );
              },
            );
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationID = verificationId;
          Get.to(
            OTPView(
              verificationId: verificationID,
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        timeout: const Duration(seconds: 60),
      );
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      notifyListeners();
      if (e.code == 'invalid-phone-number') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              title: 'Sign in Failed',
              message: e.toString(),
              btnText: 'Got it',
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              title: 'Sign in Failed',
              message: e.toString(),
              btnText: 'Got it',
            );
          },
        );
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void verifyOTP({String? code, String? verifyId, context}) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verifyId!, smsCode: code!);

    try {
      _isLoading = true;
      notifyListeners();
      await FirebaseAuth.instance.signInWithCredential(credential).then(
        (value) {
          Get.offAll(const RegisterView());
        },
      );
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            title: 'Sign in Failed',
            message: e.toString(),
            btnText: 'Got it',
          );
        },
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
