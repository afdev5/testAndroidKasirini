import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist/models/models.dart';
import 'package:todolist/services/services.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial());

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    if (event is FetchTask) {
      List<Task> task = await TaskService.getTask(event.userID);
      print('List Task Bloc : ' + task.toString());
      yield TaskLoaded((task?.isEmpty ?? true) ? [] : task);
    } else if (event is AddTask) {
      await TaskService.saveTask(event.task);
      List<Task> task = await TaskService.getTask(event.task.userID);
      print('List task after add : ' + task.toString());
      yield TaskLoaded(task);

    } else if (event is UpdateTask) {
      await TaskService.updateTask(event.task, event.uid);
      List<Task> task = await TaskService.getTask(event.task.userID);
      print('List task after add : ' + task.toString());
      yield TaskLoaded(task);
    } else if (event is DeleteTask) {
      await TaskService.deleteTask(event.uid);
      List<Task> task = await TaskService.getTask(event.task.userID);
      print('List task after add : ' + task.toString());
      yield TaskLoaded(task);
    } else if (event is FetchTaskCount) {
      var count = await TaskService.getCount(event.userID);
      List<Task> task = await TaskService.getTask(event.userID);
      print(count);
      yield TaskCount(count, task);
    }
  }
  Future<void> close() {
    return super.close();
  }
}
