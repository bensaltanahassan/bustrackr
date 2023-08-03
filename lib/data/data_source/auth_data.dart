import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AuthData {
  final auth = FirebaseAuth.instance;
  final fm = FirebaseMessaging.instance;

  Future<dynamic> signUp(String email, String password) async {
    try {
      UserCredential uc = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return uc;
    } on FirebaseAuthException catch (e) {
      return e;
    } catch (_) {}
  }

  Future<bool> checkUserLoggedIn() async {
    bool isLoggedIn = false;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      isLoggedIn = true;
    } else {
      isLoggedIn = false;
    }

    return isLoggedIn;
  }

  getToken() async {
    String? token = await fm.getToken();
    return token;
  }

  Future<dynamic> login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      return e;
    } catch (_) {}
  }

  Future<dynamic> sendEmailResetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(
        email: email,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      return e;
    } catch (_) {}
  }

  Future<void> logout() async {
    try {
      await auth.signOut();
    } catch (_) {}
  }

  sendEmailVerification(UserCredential userCredential) async {
    try {
      await userCredential.user!.sendEmailVerification();
      return true;
    } on FirebaseAuthException catch (e) {
      return e;
    } catch (_) {}
  }
}
