import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wallpaper_app/blocs/favorite-bloc.dart';
import 'package:wallpaper_app/blocs/photo-bloc.dart';
import 'package:wallpaper_app/models/Src.dart';
import 'package:wallpaper_app/screens/home/home-screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/favorite-state.dart';
import 'blocs/photo-state.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'models/Photo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory appDocumentDirectory =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(SrcAdapter());
  Hive.registerAdapter(PhotoAdapter());
  await Hive.openBox<Photo>('favoritePhotos');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() async {
    await Hive.close();
    super.dispose();
  }

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
