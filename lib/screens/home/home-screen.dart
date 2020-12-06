import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/blocs/favorite-bloc.dart';
import 'package:wallpaper_app/blocs/favorite-event.dart';
import 'package:wallpaper_app/blocs/photo-bloc.dart';
import 'package:wallpaper_app/blocs/photo-evet.dart';
import 'package:wallpaper_app/blocs/photo-state.dart';
import 'package:wallpaper_app/models/Photo.dart';
import 'package:wallpaper_app/screens/home/local-widgets/show-home-photos.dart';
import 'package:wallpaper_app/screens/components/detail-screen.dart';
import 'package:wallpaper_app/screens/favorite/favorite-screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<PhotoBloc>(context).add(GetInitialPhotosEvent(
      category: 'nature',
    ));
    super.initState();
  }

  final categories = ['Random', 'Food', 'Abstract'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<PhotoBloc, PhotoState>(
            builder: (_, state) {
              if (state is GetNewPhotosState) {
                return Text(state.category);
              }
              return Text('Loaing');
            },
          ),
          elevation: 0,
          backgroundColor: Colors.brown,
          actions: [
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                // BlocProvider.of<FavoriteBloc>(context).add(GetFavoriteEvent());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FavoriteScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        drawer: Container(
          color: Colors.transparent,
          child: ListView(
            children: categories
                .map(
                  (category) => Container(
                    color: Colors.white70,
                    child: ListTile(
                      title: Text(category),
                      onTap: () {
                        BlocProvider.of<PhotoBloc>(context).add(
                          GetInitialPhotosEvent(
                            category: category,
                          ),
                        );
                        Navigator.pop(context);
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        body: ShowHomePhotos(),
      ),
    );
  }
}
