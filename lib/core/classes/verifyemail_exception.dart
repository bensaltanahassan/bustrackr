import 'package:firebase_auth/firebase_auth.dart';

class EmailVerificationException {
  final FirebaseAuthException e;

  EmailVerificationException(this.e);

  String handleException() {
    switch (e.code) {
      case "invalid-email":
        return "Adresse email invalide";
      case "user-not-found":
        return "Utilisateur non trouvé";
      case "too-many-requests":
        return "Trop de demandes. Veuillez réessayer plus tard.";
      case "operation-not-allowed":
        return "L'opération de vérification de l'email n'est pas autorisée.";
      case "network-request-failed":
        return "Échec de la requête réseau. Veuillez vérifier votre connexion internet.";
      default:
        return "Une erreur s'est produite lors de l'envoi de la vérification par email.";
    }
  }
}
