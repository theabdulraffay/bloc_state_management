part of 'favourite_app_bloc.dart';

enum ListStatus { loading, success, failure }

class FavouriteAppState extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> toDelete;
  final ListStatus listStatus;
  const FavouriteAppState({
    this.favouriteItemList = const [],
    this.toDelete = const [],
    this.listStatus = ListStatus.loading,
  });

  FavouriteAppState copyWith(
      {List<FavouriteItemModel>? favouriteItemList,
      List<FavouriteItemModel>? toDelete,
      ListStatus? status}) {
    return FavouriteAppState(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      toDelete: toDelete ?? this.toDelete,
      listStatus: status ?? listStatus,
    );
  }

  @override
  List<Object> get props => [favouriteItemList, listStatus, toDelete];
}
