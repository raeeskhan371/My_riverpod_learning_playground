import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_learning/MyNotesFlow/auth/model/user_model.dart';

class AuthFirebaseServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // FirebaseAuth SingUp Function

  Future<void> singUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final UserCrendetial = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final uid = UserCrendetial.user!.uid;

    final user = UserModel(name: name, email: email);

    await _firestore.collection("users").doc(uid).set({
      ...user.toMap(),
      "createdAt": FieldValue.serverTimestamp(),
    });
  }

  // FirebaseAuth login Function

  Future<void> login({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // FirebaseAtuh logout Function

  Future<void> logout() async {
    await _auth.signOut();
  }

  // FirebaseAuth ForgotPassword Function

  Future<void> forgotPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
