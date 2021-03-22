part of 'models.dart';

class Friend extends Equatable {
  final String userID;
  final String name;
  final String email;
  final String foto;
  final String uid;
  final String friendID;

  Friend(
      {this.uid = 'as',
      @required this.userID,
      @required this.name,
      @required this.email,
      @required this.foto,
      @required this.friendID});

  @override
  List<Object> get props => [uid, userID, name, email, foto, friendID];
}
