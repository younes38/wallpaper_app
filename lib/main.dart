import 'package:flutter/material.dart';
import 'package:wallpaper_app/blocs/favorite-bloc.dart';
import 'package:wallpaper_app/blocs/photo-bloc.dart';
import 'package:wallpaper_app/screens/home/home-screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/favorite-state.dart';
import 'blocs/photo-state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PhotoBloc(InitialState()),
        ),
        BlocProvider(
          create: (_) => FavoriteBloc(InitialFavoriteState()),
        )
      ],
      child: MaterialApp(
        title: 'Wallpaper app',
        theme: ThemeData(
          textTheme: TextTheme(
              bodyText1: TextStyle(
            fontSize: 20,
          )),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
