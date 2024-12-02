import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_bloc.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return const Center(
              child: Text('No items found'),
            );
          }
          return ListView.builder(
            itemCount: state.todoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item ${state.todoList[index]}'),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                  ),
                  onPressed: () {
                    context.read<TodoBloc>().add(
                          RemoveTodoEvent(
                            task: state.todoList[index],
                          ),
                        );
                  },
                ),
                onTap: () {
                  // Handle item tap
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            context.read<TodoBloc>().add(
                  AddTodoEvent(
                    todoText: '$i',
                  ),
                );
          }
        },
      ),
    );
  }
}
