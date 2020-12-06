import 'package:wallpaper_app/models/Photo.dart';

abstract class PhotoState {}

class InitialState extends PhotoState {}

class LoadingState extends PhotoState {}

class GetNewPhotosState extends PhotoState {
  final category;
  final List<Photo> photos;
  GetNewPhotosState({this.photos, this.category});
}

class LoadingNewPhotosState extends PhotoState {}
