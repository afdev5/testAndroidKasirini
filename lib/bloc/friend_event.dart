part of 'friend_bloc.dart';

abstract class FriendEvent extends Equatable {
  const FriendEvent();

  @override
  List<Object> get props => [];
}

class FetchFriend extends FriendEvent {
  final String userID;
  FetchFriend(this.userID);
  @override
  List<Object> get props => [userID];
}

class AddFriend extends FriendEvent {
  final Friend friend;

  AddFriend(this.friend);
  @override
  List<Object> get props => [friend];
}
