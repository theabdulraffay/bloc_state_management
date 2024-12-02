import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(addTodo);
    on<RemoveTodoEvent>(removeTodo);
  }

  final List<String> todosList = [];

  void addTodo(AddTodoEvent event, Emitter<TodoState> emit) {
    todosList.add(event.todoText);
    emit(state.copyWith(
      todosList: List.from(todosList),
    ));
  }

  void removeTodo(RemoveTodoEvent event, Emitter<TodoState> emit) {
    todosList.remove(event.task);
    emit(state.copyWith(
      todosList: List.from(todosList),
    ));
  }
}
