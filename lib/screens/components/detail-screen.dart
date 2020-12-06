import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/blocs/favorite-bloc.dart';
import 'package:wallpaper_app/blocs/favorite-event.dart';
import 'package:wallpaper_app/blocs/favorite-state.dart';
import 'package:wallpaper_app/models/Photo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatelessWidget {
  final Photo photo;
  DetailScreen({this.photo});
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          tag: photo.id,
          child: Image.network(
            photo.src.portrait,
            fit: BoxFit.fill,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                      : null,
                ),
              );
            },
          ),
        ),
        Column(
          children: [
            Expanded(
              child: Container(),
            ),
            BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (_, state) {
                IconData icon = photo.liked
                    ? Icons.favorite
                    : Icons.favorite_border_outlined;
                if (state is AddFavoriteState) {
                  print('herer');
                  icon = Icons.favorite;
                  BlocProvider.of<FavoriteBloc>(context).add(
                    GetFavoriteEvent(),
                  );
                } else if (state is RemoveFavoriteState) {
                  icon = Icons.favorite_border_outlined;
                  BlocProvider.of<FavoriteBloc>(context).add(
                    GetFavoriteEvent(),
                  );
                }
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (photo.liked) {
                        photo.liked = false;
                        BlocProvider.of<FavoriteBloc>(context).add(
                          RemoveFavoriteEvent(id: photo.id),
                        );
                      } else {
                        photo.liked = true;
                        BlocProvider.of<FavoriteBloc>(context).add(
                          AddFavoriteEvent(photo: photo),
                        );
                      }
                    },
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ],
    );
  }
}
