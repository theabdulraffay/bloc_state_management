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
          default:
            return Column(
              children: [
                TextFormField(
                  onChanged: (val) {
                    context.read<PostBloc>().add(SearchItem(query: val));
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search with mail',
                    border: OutlineInputBorder(),
                  ),
                ),
                Expanded(
                  child: state.postStatus == PostStatus.empty
                      ? const Center(
                          child: Text('Did not find the post for the input'),
                        )
                      : ListView.builder(
                          itemCount: state.temppostModel.isEmpty
                              ? state.postModel.length
                              : state.temppostModel.length,
                          itemBuilder: (context, index) {
                            final data = state.temppostModel.isEmpty
                                ? state.postModel[index]
                                : state.temppostModel[index];
                            return ListTile(
                              title: Text(
                                data.email!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(data.body!),
                            );
                          },
                        ),
                ),
              ],
            );
        }
      }),
    );
  }
}
