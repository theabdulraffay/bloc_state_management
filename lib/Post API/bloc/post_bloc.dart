import 'package:bloc_state_management/Post%20API/Enums/enums.dart';
import 'package:bloc_state_management/Post%20API/Model/post_model.dart';
import 'package:bloc_state_management/Post%20API/Repository/post_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List<PostModel> templist = [];
  PostBloc() : super(const PostState()) {
    on<PostFetched>(_postFetch);
    on<SearchItem>(_searchItem);
  }

  void _postFetch(PostFetched event, Emitter<PostState> emit) async {
    final PostRepository postRepository = PostRepository();
    emit(state.copyWith(status: PostStatus.loading));
    await postRepository.fetchPost().then((posts) {
      emit(state.copyWith(status: PostStatus.succcess, postModel: posts));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
        status: PostStatus.failure,
        message: error.toString(),
      ));
    });
  }

  void _searchItem(SearchItem event, Emitter<PostState> emit) async {
    if (event.query.isEmpty) {
      emit(state.copyWith(temppostModel: []));
    } else {
      templist = state.postModel
          .where((element) => element.email!.contains(event.query))
          .toList();
      if (templist.isEmpty) {
        emit(state.copyWith(status: PostStatus.empty));
      } else {
        emit(state.copyWith(
            temppostModel: templist, status: PostStatus.succcess));
      }
    }
  }
}
