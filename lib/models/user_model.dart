class UserModel {
  final String fullName;
  final String nickName;
  final String mail;
  final String userId;
  final int point;

  UserModel(this.fullName, this.nickName, this.mail, this.point, this.userId);

  UserModel.fromMap(Map<String, dynamic> m) : this(m['fullName'], m['nickName'], m['mail'], m['point'], m['userID']);

  Map toMap() {
    return {'fullName': fullName, 'nickName': nickName, 'mail': mail, 'point': point, 'userID': userId};
  }
}
