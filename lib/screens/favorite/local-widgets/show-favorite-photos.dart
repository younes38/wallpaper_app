import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/blocs/favorite-bloc.dart';
import 'package:wallpaper_app/blocs/favorite-state.dart';
import 'package:wallpaper_app/blocs/photo-bloc.dart';
import 'package:wallpaper_app/blocs/photo-evet.dart';
import 'package:wallpaper_app/blocs/photo-state.dart';
import 'package:wallpaper_app/models/Photo.dart';
import 'package:wallpaper_app/screens/components/detail-screen.dart';

class ShowPhotos extends StatelessWidget {
  const ShowPhotos({
    this.photos,
  });

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (
        context,
        FavoriteState state,
      ) {
        if (state is LoadingFavoriteState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GetFavoriteState) {
          var photos = state.favoritePhotos;

          return Column(
            children: [
              Expanded(
                child: Container(
                  // color: Colors.yellow,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                    ),
                    itemCount: photos.length,
                    itemBuilder: (_, i) {
                      // if (i + 1 == photos.length) {
                      //   BlocProvider.of<PhotoBloc>(context).add(
                      //     GetNewPhotosEvent(
                      //       // page: (photos.length ~/ 15) + 1,
                      //       category: 'nature',
                      //     ),
                      //   );
                      // }
                      return InkWell(
                        onTap: () => Navigator.push(
                          _,
                          MaterialPageRoute(
                            builder: (_) => DetailScreen(
                              photo: photos[i],
                            ),
                          ),
                        ),
                        child: Container(
                          // color: Colors.yellow,
                          child: Hero(
                            tag: photos[i].id,
                            child: Image(
                              fit: BoxFit.fill,
                              loadingBuilder:
                                  (_, Widget child, ImageChunkEvent loading) {
                                if (loading == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                      value: loading.expectedTotalBytes != null
                                          ? loading.cumulativeBytesLoaded /
                                              loading.expectedTotalBytes
                                          : null),
                                );
                              },
                              image: NetworkImage(
                                photos[i].src.tiny,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
