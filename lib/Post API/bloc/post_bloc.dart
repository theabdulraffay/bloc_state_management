import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/Post%20API/Enums/enums.dart';
import 'package:bloc_state_management/Post%20API/Model/post_model.dart';
import 'package:bloc_state_management/Post%20API/Repository/post_repository.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<PostFetched>(_postFetch);
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
}
