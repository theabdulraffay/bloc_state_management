part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostFetched extends PostEvent {}

class SearchItem extends PostEvent {
  final String query;
  const SearchItem({required this.query});
}
