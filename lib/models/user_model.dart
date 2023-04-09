class UserModel {
  final String fullName;
  final String nickName;
  final String mail;
  final String userId;
  final int point;
  final int firstQuestion;

  UserModel(this.fullName, this.nickName, this.mail, this.point, this.userId, this.firstQuestion);

  Map toMap() {
    return {'fullName': fullName, 'nickName': nickName, 'mail': mail, 'point': point, 'userID': userId};
  }
}
