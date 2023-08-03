
import 'package:criccoin/Login%20Flow/OptVerification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  bool _isSignedIn = false;

  bool get isSignedIn => _isSignedIn;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String? _uid;

  String get uid => _uid!;

  // UserModel? _userModel;
  // UserModel get userModel => _userModel!;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Auth() {
    checkSign();
  }

  void checkSign() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("is_signedin") ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool("is_signedin", true);
    _isSignedIn = true;
    notifyListeners();
  }

  // signin
  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
            await _firebaseAuth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(throw Exception(error.message).toString()),
              ),
            );
          },
          codeSent: (verificationId, forceResendingToken) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OptVerification(verificationId: verificationId, userNumber: phoneNumber),
            ));
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message.toString()),
        ),
      );
    }
  }

  Future userSignOut() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await _firebaseAuth.signOut();
    _isSignedIn = false;
    notifyListeners();
    s.clear();
  }
}
