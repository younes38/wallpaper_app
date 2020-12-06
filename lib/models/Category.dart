import 'package:flutter/foundation.dart';

import 'Photo.dart';

class Category {
  final name;
  final List<Photo> photos;
  Category({this.photos, this.name});
}

class TestData {
  static List<Photo> allPhotos = List<Photo>();
  static addPhotos(List<Photo> photos) {
    allPhotos.addAll(photos);
  }

  // static removeFavorite(int id) {
  //   photos.removeWhere((photo) => photo.id == id);
  // }

  static getPhotos() {
    return allPhotos;
  }
}
