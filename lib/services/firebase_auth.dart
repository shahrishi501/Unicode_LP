import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);
  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
  
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    
  }
}
