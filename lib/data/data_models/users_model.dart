class UserModel {
  String? uid;
  String? email;
  String? telephone;
  String? token;
  String? nomComplet;
  String? dateCreated;

  // tojson
  UserModel({
    this.uid,
    this.email,
    this.telephone,
    this.token,
    this.nomComplet,
    this.dateCreated,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    telephone = json['telephone'];
    token = json['token'];
    nomComplet = json['nomComplet'];
    dateCreated = json['dateCreated'];
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'telephone': telephone,
      'token': token,
      'nomComplet': nomComplet,
      'dateCreated': dateCreated,
    };
  }
}
