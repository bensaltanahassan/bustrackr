import 'package:firebase_auth/firebase_auth.dart';

class SignUpException {
  final FirebaseAuthException e;

  SignUpException(this.e);

  String handleException() {
    switch (e.code) {
      case "email-already-in-use":
        return "Email déjà utilisé";
      case "invalid-email":
        return "Email n'est pas valide";
      case "operation-not-allowed":
        return "Opération non autorisée";
      case "weak-password":
        return "Mot de passe faible";
      default:
        return "Problème de connexion";
    }
  }
}
