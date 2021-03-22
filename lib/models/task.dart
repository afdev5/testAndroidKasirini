part of 'models.dart';

class Task extends Equatable {
  final String userID;
  final String title;
  final String category;
  final DateTime dateTime;
  final String uid;
  final Friend friend;
  final String nameUser;

  Task(
      {this.uid = 'as',
      @required this.userID,
      @required this.nameUser,
      @required this.title,
      @required this.category,
      @required this.dateTime,
      @required this.friend});

  @override
  List<Object> get props =>
      [uid, userID, nameUser, title, category, dateTime, friend];
}
