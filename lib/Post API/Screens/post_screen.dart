import 'package:bloc_state_management/Post%20API/Enums/enums.dart';
import 'package:bloc_state_management/Post%20API/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Bloc'),
        centerTitle: true,
      ),
      body: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        switch (state.postStatus) {
          case PostStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case PostStatus.failure:
            return Text('An error occurred: ${state.message}');
          case PostStatus.succcess:
            return ListView.builder(
              itemCount: state.postModel.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    state.postModel[index].name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(state.postModel[index].body!),
                );
              },
            );
          default:
            return const Text('Post Screen');
        }
      }),
    );
  }
}
