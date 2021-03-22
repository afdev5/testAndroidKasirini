part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class FetchTask extends TaskEvent {
  final String userID;
  FetchTask(this.userID);
  @override
  List<Object> get props => [userID];
}

class AddTask extends TaskEvent {
  final Task task;

  AddTask(this.task);
  @override
  List<Object> get props => [task];
}


class UpdateTask extends TaskEvent {
   final Task task;
  final String uid;

  UpdateTask(this.task, this.uid);
  @override
  List<Object> get props => [task, uid];
}

class DeleteTask extends TaskEvent {
  final String uid;
  final Task task;

  DeleteTask(this.task, this.uid);
  @override
  List<Object> get props => [task, uid];
}

class FetchTaskCount extends TaskEvent {
  final String userID;
  FetchTaskCount(this.userID);
  @override
  List<Object> get props => [userID];
}


