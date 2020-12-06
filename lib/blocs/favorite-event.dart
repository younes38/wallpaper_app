abstract class FavoriteEvent {}

class GetFavoriteEvent extends FavoriteEvent {}

class AddFavoriteEvent extends FavoriteEvent {
  final photo;
  AddFavoriteEvent({this.photo});
}

class RemoveFavoriteEvent extends FavoriteEvent {
  final id;
  RemoveFavoriteEvent({this.id});
}
