part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();
  
 
}

class TaskInitial extends TaskState {
   @override
  List<Object> get props => [];
}

class TaskLoaded extends TaskState {
  final List<Task> task;

  TaskLoaded(this.task);

  @override
  List<Object> get props => [task];
}

// ignore: must_be_immutable
class TaskCount extends TaskState {
  List<Object> count;
  final List<Task> task;

  TaskCount(this.count, this.task);
  @override
  List<Object> get props => [count, task];
}