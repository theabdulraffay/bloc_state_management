import 'package:bloc_state_management/Favourite%20App/Model/favourite_item_model.dart';
import 'package:bloc_state_management/Favourite%20App/bloc/favourite_app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteAppBloc>().add(FetchFavouriteListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Favourite App Screen'),
        centerTitle: true,
        actions: [
          BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
            builder: (context, state) {
              return state.toDelete.isNotEmpty
                  ? IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        context.read<FavouriteAppBloc>().add(
                              DeleteItem(),
                            );
                      },
                    )
                  : Container();
            },
          ),
        ],
      ),
      body: BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ListStatus.failure:
              return AlertDialog(
                title: const Text('AlertDialog Title'),
                content: const SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('This is a demo alert dialog.'),
                      Text('Would you like to approve of this message?'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Approve'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );

            case ListStatus.success:
              return ListView.builder(
                itemCount: state.favouriteItemList.length,
                itemBuilder: (context, index) {
                  final data = state.favouriteItemList[index];
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                          value: data.isDeleting,
                          onChanged: (value) {
                            if (value ?? true) {
                              // state.toDelete.add(index);
                              context
                                  .read<FavouriteAppBloc>()
                                  .add(SelectItemEvent(index: index));
                            } else {
                              context
                                  .read<FavouriteAppBloc>()
                                  .add(UnSelectItemEvent(index: index));
                            }
                          }),
                      title: Text(
                        data.value.toString(),
                        style: data.isDeleting
                            ? const TextStyle(
                                decoration: TextDecoration.lineThrough)
                            : const TextStyle(),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          FavouriteItemModel favouriteItemModel =
                              FavouriteItemModel(
                                  id: data.id,
                                  value: data.value,
                                  isDeleting: data.isDeleting,
                                  isFavourite: !data.isFavourite);
                          context.read<FavouriteAppBloc>().add(
                                FavouriteItemEvent(model: favouriteItemModel),
                              );
                        },
                        icon: Icon(data.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined),
                      ),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
