import 'package:wallpaper_app/models/Photo.dart';

class HiveDatabase {
  static List<Photo> photos = List<Photo>();
  static addFavorite(Photo photo) {
    if (!photos.contains(photo)) {
      photos.add(photo);
    }
  }

  static removeFavorite(int id) {
    photos.removeWhere((photo) => photo.id == id);
  }

  static getFavorite() {
    return photos;
  }
}
