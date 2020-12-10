import 'package:hive/hive.dart';

import 'Src.dart';

part 'Photo.g.dart';

@HiveType(typeId: 1)
class Photo {
  @HiveField(0)
  int id;
  @HiveField(1)
  int height;
  @HiveField(2)
  int width;
  @HiveField(3)
  int photographerId;
  @HiveField(4)
  String url;
  @HiveField(5)
  String photographer;
  @HiveField(6)
  String photographerUrl;
  @HiveField(7)
  bool liked = false;
  @HiveField(8)
  Src src;

  Photo({
    this.id,
    this.height,
    this.width,
    this.photographer,
    this.photographerId,
    this.photographerUrl,
    this.src,
    this.url,
    this.liked = false,
  });

  factory Photo.fromJSON(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      height: json['height'],
      width: json['width'],
      url: json['url'],
      photographerId: json['photographerId'],
      photographer: json['photographer'],
      photographerUrl: json['photographerUrl'],
      src: Src.fromJSON(json['src']),
    );
  }

  // toJSON() {
  //   return {
  //     'id': this.id,
  //     'iheightd': this.height,
  //     'width': this.width,
  //     'url': this.url,
  //     'photographerId': this.photographerId,
  //     'photographer': this.photographer,
  //     'photographerUrl': this.photographerUrl,
  //     'src': this.src.toJSON(),
  //   };
  // }
}
