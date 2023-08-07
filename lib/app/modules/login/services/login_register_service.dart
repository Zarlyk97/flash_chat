import 'package:firebase_auth/firebase_auth.dart';

class LoginserVice {
  static Future<UserCredential?> register(String email, String password) async {
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } catch (e) {
      print('Register error: ${e.toString()}');
      return null;
    }
  }

////////////////////////////////////////////////////////////////////////////////

  static Future<UserCredential?> login(String email, String password) async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } catch (e) {
      print('Register error: ${e.toString()}');
      return null;
    }
  }
}
