// import 'package:firebase_auth/firebase_auth.dart'; // TEMP_DISABLED_FIREBASE
// import 'package:cloud_firestore/cloud_firestore.dart'; // TEMP_DISABLED_FIREBASE
import '../../data/models/user_model.dart';

class AuthService {
  // final FirebaseAuth _auth = FirebaseAuth.instance; // TEMP_DISABLED_FIREBASE
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance; // TEMP_DISABLED_FIREBASE

  // Stream<User?> get authStateChanges => _auth.authStateChanges(); // TEMP_DISABLED_FIREBASE
  Stream<dynamic> get authStateChanges => Stream.value(null); // TEMP_DISABLED_FIREBASE

  Future<void> verifyPhone({
    required String phoneNumber,
    required Function(String verificationId) codeSent,
    required Function(dynamic e) verificationFailed, // Changed type from FirebaseAuthException // TEMP_DISABLED_FIREBASE
  }) async {
    // Mocking success for development without Firebase
    await Future.delayed(const Duration(seconds: 2));
    codeSent("mock_verification_id");
  }

  Future<dynamic> verifyOtp(String verificationId, String smsCode) async { // TEMP_DISABLED_FIREBASE
    // Mocking
    await Future.delayed(const Duration(seconds: 1));
    return null; // Return mock credential if needed
  }

  Future<void> saveUserProfile(UserModel user) async {
    // await _firestore.collection('users').doc(user.uid).set(user.toMap()); // TEMP_DISABLED_FIREBASE
  }

  Future<UserModel?> getUserProfile(String uid) async {
    // final doc = await _firestore.collection('users').doc(uid).get(); // TEMP_DISABLED_FIREBASE
    // if (doc.exists) { // TEMP_DISABLED_FIREBASE
    //   return UserModel.fromMap(doc.data()!); // TEMP_DISABLED_FIREBASE
    // } // TEMP_DISABLED_FIREBASE
    return null;
  }

  Future<void> signOut() async {
    // await _auth.signOut(); // TEMP_DISABLED_FIREBASE
  }
}
