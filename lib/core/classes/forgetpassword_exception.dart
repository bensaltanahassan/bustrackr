import 'package:firebase_auth/firebase_auth.dart';

class ForgetPasswordException {
  final FirebaseAuthException e;

  ForgetPasswordException(this.e);

  String handleException() {
    switch (e.code) {
      case "user-not-found":
        return "Aucun utilisateur trouvé avec cet email";
      case "invalid-email":
        return "Email invalide";
      default:
        return "Une erreur s'est produite";
    }
  }
}
