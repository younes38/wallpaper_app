import 'package:hive/hive.dart';

part 'Src.g.dart';

@HiveType(typeId: 0)
class Src {
  @HiveField(0)
  String original;
  @HiveField(1)
  String large;
  @HiveField(2)
  String large2x;
  @HiveField(3)
  String medium;
  @HiveField(4)
  String small;
  @HiveField(5)
  String portrait;
  @HiveField(6)
  String landscape;
  @HiveField(7)
  String tiny;
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
