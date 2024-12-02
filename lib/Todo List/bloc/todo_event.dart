part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddTodoEvent extends TodoEvent {
  final String todoText;
  const AddTodoEvent({required this.todoText});
  @override
  List<Object> get props => [todoText];
}

class RemoveTodoEvent extends TodoEvent {
  final Object task;
  const RemoveTodoEvent({required this.task});

  @override
  List<Object> get props => [task];
}
