import 'package:bloc_state_management/Favourite%20App/Model/favourite_item_model.dart';

class FavouriteRepository {
  Future<List<FavouriteItemModel>> fetchItem() async {
    // ignore: prefer_const_constructors
    await Future.delayed(Duration(seconds: 3));
    return List.of(
      _generateList(10),
    );
  }

  List<FavouriteItemModel> _generateList(int length) {
    return List.generate(
      length,
      (index) => FavouriteItemModel(
        id: index.toString(),
        value: 'Item $index',
      ),
    );
  }
}
