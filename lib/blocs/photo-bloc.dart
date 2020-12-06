import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:wallpaper_app/blocs/photo-evet.dart';
import 'package:wallpaper_app/blocs/photo-state.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/models/Category.dart';
import 'package:wallpaper_app/models/Photo.dart';

import '../gobal.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc(PhotoState initialState) : super(initialState);

  @override
  Stream<PhotoState> mapEventToState(PhotoEvent event) async* {
    // if (event is GetPhotosEvent) {
    //   yield LoadingState();

    //   var json = await http.get(
    //       Global.apiURL +
    //           '?query=' +
    //           event.category +
    //           '&per_page=' +
    //           Global.per_page.toString(),
    //       headers: {"Authorization": Global.token});

    //   var parsedJson = jsonDecode(json.body);
    //   print(parsedJson);

    //   List<Photo> photos = parsedJson["photos"].map<Photo>((photo) {
    //     return Photo.fromJSON(photo);
    //   }).toList();
    //   TestData.addPhotos(photos);
    //   yield GetPhotosState(
    //     newPhotos: photos,
    //     category: event.category,
    //   );
    // }
    final currentState = state;
    if (event is GetInitialPhotosEvent) {
      // yield LoadingNewPhotosState();

      var json = await http.get(
        Global.apiURL +
            '?query=' +
            event.category +
            '&per_page=' +
            Global.per_page.toString(),
        headers: {"Authorization": Global.token},
      );
      var parsedJson = jsonDecode(json.body);
      print(parsedJson);

      List<Photo> photos = parsedJson["photos"].map<Photo>((photo) {
        return Photo.fromJSON(photo);
      }).toList();
      // TestData.addPhotos(photos);
      yield GetNewPhotosState(
        photos: photos,
        category: event.category,
      );
    } else if (event is GetNewPhotosEvent) {
      if (currentState is GetNewPhotosState) {
        var json = await http.get(
          Global.apiURL +
              '?query=' +
              event.category +
              '&per_page=' +
              Global.per_page.toString() +
              '&page=' +
              (currentState.photos.length ~/ Global.per_page + 1).toString(),
          headers: {"Authorization": Global.token},
        );

        var parsedJson = jsonDecode(json.body);
        print(parsedJson);

        List<Photo> photos = parsedJson["photos"].map<Photo>((photo) {
          return Photo.fromJSON(photo);
        }).toList();
        // TestData.addPhotos(photos);
        yield GetNewPhotosState(
          photos: currentState.photos + photos,
          category: event.category,
        );
      }
    }
  }
}
