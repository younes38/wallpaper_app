import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/blocs/favorite-bloc.dart';
import 'package:wallpaper_app/blocs/favorite-event.dart';
import 'package:wallpaper_app/blocs/favorite-state.dart';
import 'package:wallpaper_app/screens/favorite/local-widgets/show-favorite-photos.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    BlocProvider.of<FavoriteBloc>(context).add(GetFavoriteEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farovite'),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, FavoriteState state) {
          if (state is AddFavoriteState || state is RemoveFavoriteState) {
            BlocProvider.of<FavoriteBloc>(context).add(GetFavoriteEvent());
            return Container();
          }
          if (state is GetFavoriteState) {
            return ShowPhotos(
              photos: state.favoritePhotos,
            );
          }
          return Container();
        },
      ),
    );
  }
}
