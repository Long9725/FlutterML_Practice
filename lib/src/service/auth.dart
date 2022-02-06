import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user = null;
  String _verificationdId = "";

  void setUser(User? user) {
    _user = user;
    // notifyListeners();
  }

  User? getUser() {
    return _user;
  }

  Future verifyPhoneNumber(String phoneNumber) async {
    _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          print("completed");
          await _auth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          print("codeSent");
          _verificationdId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  Future signInWithPhoneNumber(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: _verificationdId, smsCode: smsCode);
      setUser((await _auth.signInWithCredential(credential)).user);
    } catch (e) {
      print(e);
    }
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
//
// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   User? _user = null;
//   String _verificationId = "";
//
//   void setUser(User? user) {
//     _user = user;
//   }
//
//   User? getUser() {
//     return _user;
//   }
//
//   String getVerificationId() {
//     return _verificationId;
//   }
//
//   verifyPhoneNumber(String phoneNumber) {
//     _auth.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           await _auth.signInWithCredential(credential);
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           print(e);
//         },
//         codeSent: (String verificationId, int? resendToken) {
//           _verificationId = verificationId;
//           print("codeSent");
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {});
//     _auth.signInWithPhoneNumber(phoneNumber);
//   }
//
//   signInWithPhoneNumber(String verificationId, String smsCode) async {
//     try {
//       final AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
//       final User? user = (await _auth.signInWithCredential(credential)).user;
//       setUser(user);
//     } catch (e){
//       print(e);
//     }
//   }
// }
//
// // import 'package:firebase_auth/firebase_auth.dart';
// //
// // class AuthService {
// //   final FirebaseAuth _auth = FirebaseAuth.instance;
// //   User? _user = null;
// //   String _verificationId = "";
// //
// //   void setUser(User? user) {
// //     _user = user;
// //   }
// //
// //   User? getUser() {
// //     return _user;
// //   }
// //
// //   String getVerificationId() {
// //     return _verificationId;
// //   }
// //
// //   verifyPhoneNumber(String phoneNumber) async {
// //     _auth.verifyPhoneNumber(
// //         phoneNumber: phoneNumber,
// //         timeout: const Duration(seconds: 60),
// //         verificationCompleted: (PhoneAuthCredential credential) async {
// //           print('completed');
// //           await _auth.signInWithCredential(credential);
// //         },
// //         verificationFailed: (FirebaseAuthException e) {
// //           if (e.code == 'invalid-phone-number') {
// //             print('The provided phone number is not valid.');
// //           } else {
// //             print(e);
// //           }
// //         },
// //         codeSent: (String verificationId, int? resendToken) async {
// //           print('codesent');
// //           _verificationId = verificationId;
// //         },
// //         codeAutoRetrievalTimeout: (String verificationId) {});
// //   }
// //
// //   signInWithPhoneNumber(String verificationId, String smsCode) async {
// //     try {
// //       final AuthCredential credential = PhoneAuthProvider.credential(
// //           verificationId: verificationId, smsCode: smsCode);
// //       final User? user = (await _auth.signInWithCredential(credential)).user;
// //       setUser(user);
// //     } catch (e) {
// //       print(e);
// //     }
// //   }
// //
// //   signOut() async {
// //     try {
// //       print("sing out complete");
// //       await _auth.signOut();
// //       setUser(null);
// //     } catch (e) {
// //       print("sign out failed");
// //       print(e.toString());
// //       return null;
// //     }
// //   }
// // }
