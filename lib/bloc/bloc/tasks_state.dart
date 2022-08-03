import 'package:equatable/equatable.dart';

import '../../models/task.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  const TasksState({
    this.allTasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks];
}
