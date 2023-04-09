class UserModel {
  final String fullName;
  final String nickName;
  final String mail;
  final String password;
  final int point;

  UserModel(this.fullName, this.nickName, this.mail, this.password, this.point);

  UserModel.fromMap(Map<String, dynamic> m) : this(m['fullName'], m['nickname'], m['mail'], m['password'], m['point']);

  Map toMap() {
    return {'fullName': fullName, 'nickName': nickName, 'mail': mail, 'password': password, 'point': point};
  }
}
