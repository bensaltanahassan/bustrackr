import 'package:firebase_auth/firebase_auth.dart';

class LoginException {
  final FirebaseAuthException e;

  LoginException(this.e);

  String handleException() {
    switch (e.code) {
      case "invalid-email":
        return "Email n'est pas valide";
      case "user-not-found":
        return "Utilisateur n'existe pas";
      case "wrong-password":
        return "Mot de passe incorrect";
      case "user-disabled":
        return "Utilisateur désactivé";
      case "too-many-requests":
        return "Trop de requêtes,essayer prochainement";
      case "operation-not-allowed":
        return "Opération non autorisée";
      default:
        return "Problème de connexion";
    }
  }
}
