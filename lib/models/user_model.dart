class UserModel {
  final String fullName;
  final String nickName;
  final String mail;
  final String password;

  UserModel(this.fullName, this.nickName, this.mail, this.password);

  UserModel.fromMap(Map<String, dynamic> m) : this(m['fullName'], m['nickname'], m['mail'], m['password']);

  Map toMap() {
    return {'fullName': fullName, 'nickName': nickName, 'mail': mail, 'password': password};
  }
}
