class UserModel {
  String? uid;
  String? email;
  String? telephone;
  String? token;
  String? nomComplet;
  String? dateCreated;
  String? photoUrl;

  // tojson
  UserModel({
    this.uid,
    this.email,
    this.telephone,
    this.token,
    this.nomComplet,
    this.dateCreated,
    this.photoUrl,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    telephone = json['telephone'];
    token = json['token'];
    nomComplet = json['nomComplet'];
    dateCreated = json['dateCreated'];
    photoUrl = json['photoUrl'];
  }

  // add toJson but just the element that not null
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['telephone'] = telephone;
    data['token'] = token;
    data['nomComplet'] = nomComplet;
    data['dateCreated'] = dateCreated;
    data['photoUrl'] = photoUrl;
    return data;
  }
}
