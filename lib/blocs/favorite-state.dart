import 'package:wallpaper_app/blocs/favorite-event.dart';
import 'package:wallpaper_app/blocs/photo-state.dart';
import 'package:wallpaper_app/models/Photo.dart';

abstract class FavoriteState {}

class InitialFavoriteState extends FavoriteState {}

class LoadingFavoriteState extends FavoriteState {}

class GetFavoriteState extends FavoriteState {
  List<Photo> favoritePhotos;
  GetFavoriteState({this.favoritePhotos});
}

class AddFavoriteState extends FavoriteState {}

class RemoveFavoriteState extends FavoriteState {}
