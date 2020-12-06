import 'package:flutter/cupertino.dart';

class Src {
  String original, large, large2x, medium, small, portrait, landscape, tiny;
  Src({
    this.original,
    this.landscape,
    this.large,
    this.large2x,
    this.medium,
    this.portrait,
    this.small,
    this.tiny,
  });
  factory Src.fromJSON(Map<String, dynamic> json) {
    return Src(
      landscape: json['landscape'],
      large2x: json['large2x'],
      large: json['shotcut '],
      medium: json['medium'],
      original: json['original'],
      portrait: json['portrait'],
      small: json['small'],
      tiny: json['tiny'],
    );
  }
  // toJSON() {
  //   return {
  //     'landscape': this.landscape,
  //     'large2x': this.large2x,
  //     'large': this.landscape,
  //     'medium': this.landscape,
  //     'original': this.landscape,
  //     'portrait': this.landscape,
  //     'small': this.landscape,
  //     'tiny': this.landscape,
  //   };
  // }
}
