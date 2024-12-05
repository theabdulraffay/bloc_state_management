part of 'favourite_app_bloc.dart';

sealed class FavouriteAppEvent extends Equatable {
  const FavouriteAppEvent();

  @override
  List<Object> get props => [];
}

class FetchFavouriteListEvent extends FavouriteAppEvent {}

class FavouriteItemEvent extends FavouriteAppEvent {
  final FavouriteItemModel model;
  const FavouriteItemEvent({required this.model});
}

class SelectItemEvent extends FavouriteAppEvent {
  final int index;
  const SelectItemEvent({required this.index});
}

class UnSelectItemEvent extends FavouriteAppEvent {
  final int index;
  const UnSelectItemEvent({required this.index});
}

class DeleteItem extends FavouriteAppEvent {}
