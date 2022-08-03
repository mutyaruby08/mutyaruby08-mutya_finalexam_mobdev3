import 'package:bloc_finals_exam/bloc/bloc/tasks_event.dart';
import 'package:bloc_finals_exam/bloc/bloc/tasks_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/task.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(allTasks: List.from(state.allTasks)..add(event.task)));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.add(task.copyWith(isDone: true))
        : allTasks.add(task.copyWith(isDone: false));

    emit(TasksState(allTasks: allTasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {}
}
