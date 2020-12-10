import 'package:hive/hive.dart';
import 'package:wallpaper_app/models/Photo.dart';

class HiveDatabase {
  static List<Photo> photos = List<Photo>();

  static addFavorite(Photo photo) {
    int indexPhoto = photos.indexWhere((element) => element.id == photo.id);
    if (indexPhoto < 0) {
      Hive.box<Photo>('favoritePhotos').add(photo);

      photos.add(photo);
    }
  }

  static removeFavorite(int id) {
    int indexPhoto = photos.indexWhere((photo) => photo.id == id);
    if (indexPhoto >= 0) {
      photos.removeAt(indexPhoto);
      Hive.box<Photo>('favoritePhotos').deleteAt(indexPhoto);
    }
  }

  static getFavorite() {
    photos = Hive.box<Photo>('favoritePhotos').values.toList();
    return photos;
  }
}
