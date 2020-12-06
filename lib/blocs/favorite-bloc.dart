import 'package:bloc/bloc.dart';
import 'package:wallpaper_app/blocs/favorite-event.dart';
import 'package:wallpaper_app/blocs/favorite-state.dart';
import 'package:wallpaper_app/models/Photo.dart';
import '../services/HiveDatabase.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc(FavoriteState initialState) : super(initialState);

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    if (event is AddFavoriteEvent) {
      HiveDatabase.addFavorite(event.photo);
      yield AddFavoriteState();
    } else if (event is RemoveFavoriteEvent) {
      HiveDatabase.removeFavorite(event.id);
      yield RemoveFavoriteState();
    } else if (event is GetFavoriteEvent) {
      List<Photo> favoritePhotos = HiveDatabase.getFavorite();
      yield GetFavoriteState(favoritePhotos: favoritePhotos);
    }
  }
}
