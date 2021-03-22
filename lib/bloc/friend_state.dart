part of 'friend_bloc.dart';

abstract class FriendState extends Equatable {
  const FriendState();

}

class FriendInitial extends FriendState {
   @override
  List<Object> get props => [];
}

class FriendLoaded extends FriendState {
  final List<Friend> friend;

  FriendLoaded(this.friend);

  @override
  List<Object> get props => [friend];
}
