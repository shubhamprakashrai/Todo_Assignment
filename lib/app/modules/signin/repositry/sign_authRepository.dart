import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 🔹 Sign in with Email & Password
  Future<UserModel?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        return UserModel(uid: user.uid, email: user.email ?? "");
      }
      return null;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  //  Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
