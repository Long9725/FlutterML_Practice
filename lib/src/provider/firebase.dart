import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user = null;
  String _verificationdId = "";
  String _lastFirebaseMessage = "";

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }

  User? getUser() {
    return _user;
  }

  Future verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          print("completed");
          await _auth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e);
          _lastFirebaseMessage = e.toString();
        },
        codeSent: (String verificationId, int? resendToken) {
          print("codeSent");
          _verificationdId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
    return _lastFirebaseMessage;
  }

  Future signInWithPhoneNumber(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationdId, smsCode: smsCode);
      setUser((await _auth.signInWithCredential(credential)).user);
    } catch (e) {
      print(e);
      _lastFirebaseMessage = e.toString();
    }
  }
}
