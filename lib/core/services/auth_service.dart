import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> verifyPhone({
    required String phoneNumber,
    required Function(String verificationId) codeSent,
    required Function(FirebaseAuthException e) verificationFailed,
  }) async {
    // Placeholder for actual Firebase Phone Auth
    // In real implementation:
    // await _auth.verifyPhoneNumber(
    //   phoneNumber: phoneNumber,
    //   verificationCompleted: (_) {},
    //   verificationFailed: verificationFailed,
    //   codeSent: (verificationId, _) => codeSent(verificationId),
    //   codeAutoRetrievalTimeout: (_) {},
    // );

    // Mocking success for development
    await Future.delayed(const Duration(seconds: 2));
    codeSent("mock_verification_id");
  }

  Future<UserCredential?> verifyOtp(String verificationId, String smsCode) async {
    // Placeholder for actual OTP verification
    // PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //   verificationId: verificationId,
    //   smsCode: smsCode,
    // );
    // return await _auth.signInWithCredential(credential);

    // Mocking
    await Future.delayed(const Duration(seconds: 1));
    return null; // Return mock credential if needed
  }

  Future<void> saveUserProfile(UserModel user) async {
    await _firestore.collection('users').doc(user.uid).set(user.toMap());
  }

  Future<UserModel?> getUserProfile(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.data()!);
    }
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
