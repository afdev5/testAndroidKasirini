import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist/models/models.dart';
import 'package:todolist/services/services.dart';

part 'friend_event.dart';
part 'friend_state.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  FriendBloc() : super(FriendInitial());

  @override
  Stream<FriendState> mapEventToState(
    FriendEvent event,
  ) async* {
    if (event is FetchFriend) {
      print('id di bloc ' + event.userID);
      List<Friend> friend = await FriendService.getFriend(event.userID);
      print('List Friend Bloc : ' + friend.toString());
      yield FriendLoaded((friend?.isEmpty ?? true) ? [] : friend);
    } else if (event is AddFriend) {
      await FriendService.addFriend(event.friend);
      List<Friend> friend = await FriendService.getFriend(event.friend.userID);
      print('List Friend Bloc : ' + friend.toString());
      yield FriendLoaded(friend);
    }
  }

  Future<void> close() {
    return super.close();
  }
}
