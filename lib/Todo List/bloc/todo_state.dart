part of 'todo_bloc.dart';

class TodoState extends Equatable {
  const TodoState({this.todoList = const []});
  final List<String> todoList;

  @override
  List<Object> get props => [todoList];

  TodoState copyWith({List<String>? todosList}) {
    return TodoState(
      todoList: todosList ?? todoList,
    );
  }
}
