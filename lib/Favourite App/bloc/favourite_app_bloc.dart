import 'package:bloc_state_management/Favourite%20App/Model/favourite_item_model.dart';
import 'package:bloc_state_management/Favourite%20App/repository/favourite_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favourite_app_event.dart';
part 'favourite_app_state.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteAppState> {
  FavouriteRepository favouriteRepository;
  List<FavouriteItemModel> favouritelist = [];
  List<int> toDelete = [];
  List<FavouriteItemModel> tempfavouritelist = [];
  FavouriteAppBloc(this.favouriteRepository)
      : super(const FavouriteAppState()) {
    on<FetchFavouriteListEvent>(_fetchList);
    on<FavouriteItemEvent>(_addfavouriteitem);
    on<SelectItemEvent>(_selectItem);
    on<UnSelectItemEvent>(_unselectItem);
    on<DeleteItem>(_deleteItem);
  }

  void _fetchList(
      FetchFavouriteListEvent event, Emitter<FavouriteAppState> emit) async {
    favouritelist = await favouriteRepository.fetchItem();
    emit(state.copyWith(
        favouriteItemList: List.from(favouritelist),
        status: ListStatus.success));
  }

  void _addfavouriteitem(
      FavouriteItemEvent event, Emitter<FavouriteAppState> emit) async {
    final index =
        favouritelist.indexWhere((element) => element.id == event.model.id);

    favouritelist[index] = event.model;
    emit(
      state.copyWith(
        favouriteItemList: List.from(favouritelist),
        // tempfavouriteItemList: tempfavouritelist,
      ),
    );
  }

  void _selectItem(
      SelectItemEvent event, Emitter<FavouriteAppState> emit) async {
    favouritelist[event.index] = favouritelist[event.index].copyWith(
      isDeleting: true,
    );

    // state.toDelete.add(event.index);
    List<FavouriteItemModel> changed = List.from(state.toDelete);
    changed.add(favouritelist[event.index]);
    emit(
      state.copyWith(
        favouriteItemList: List.from(favouritelist),
        toDelete: changed,
        // tempfavouriteItemList: tempfavouritelist,
      ),
    );
  }

  void _unselectItem(
      UnSelectItemEvent event, Emitter<FavouriteAppState> emit) async {
    favouritelist[event.index] = favouritelist[event.index].copyWith(
      isDeleting: false,
    );

    // state.toDelete.remove(event.index);
    List<FavouriteItemModel> changed = List.from(state.toDelete);
    changed.remove(favouritelist[event.index]);

    emit(
      state.copyWith(
        favouriteItemList: List.from(favouritelist),
        toDelete: changed,
        // tempfavouriteItemList: tempfavouritelist,
      ),
    );
  }

  void _deleteItem(DeleteItem event, Emitter<FavouriteAppState> emit) async {
    for (FavouriteItemModel i in state.toDelete) {
      favouritelist.remove(i);
    }
    emit(
      state.copyWith(
        favouriteItemList: List.from(favouritelist),
        toDelete: [],
        status: favouritelist.isEmpty ? ListStatus.failure : null,
      ),
    );
  }
}
