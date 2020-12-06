import 'Src.dart';

class Photo {
  int id, height, width, photographerId;
  String url, photographer, photographerUrl;
  bool liked = false;
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
