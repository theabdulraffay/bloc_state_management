part of 'post_bloc.dart';

class PostState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postModel;
  final String message;

  const PostState({
    this.postStatus = PostStatus.loading,
    this.postModel = const [],
    this.message = '',
  });

  PostState copyWith(
      {PostStatus? status, List<PostModel>? postModel, String? message}) {
    return PostState(
      postStatus: status ?? postStatus,
      postModel: postModel ?? this.postModel,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [postStatus, postModel, message];
}
