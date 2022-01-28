import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user = null;
  String _verificationId = "";

  void setUser(User? user) {
    _user = user;
  }

  User? getUser() {
    return _user;
  }

  String getVerificationId() {
    return _verificationId;
  }

  verifyPhoneNumber(String phoneNumber) async {
    _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          print('completed');
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          } else {
            print(e);
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          print('codesent');
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  signInWithPhoneNumber(String verificationId, String smsCode) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      final User? user = (await _auth.signInWithCredential(credential)).user;
      setUser(user);
    } catch (e) {
      print(e);
    }
  }

  signOut() async {
    try {
      print("sing out complete");
      await _auth.signOut();
      setUser(null);
    } catch (e) {
      print("sign out failed");
      print(e.toString());
      return null;
    }
  }
}
