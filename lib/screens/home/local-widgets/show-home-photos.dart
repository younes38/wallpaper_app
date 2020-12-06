import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/blocs/photo-bloc.dart';
import 'package:wallpaper_app/blocs/photo-evet.dart';
import 'package:wallpaper_app/blocs/photo-state.dart';
import 'package:wallpaper_app/models/Photo.dart';
import 'package:wallpaper_app/screens/components/detail-screen.dart';

class ShowHomePhotos extends StatefulWidget {
  // const ShowHomePhotos({
  //   this.photos,
  // });

  // final List<Photo> photos;
  // final List<Photo> photos = List<Photo>();
  @override
  _ShowHomePhotosState createState() => _ShowHomePhotosState();
}

class _ShowHomePhotosState extends State<ShowHomePhotos> {
  // final _scrollController = ScrollController();
  // final _scrollThreshold = 5.0;
  // PhotoBloc _photoBloc;

  @override
  void initState() {
    super.initState();
    //  _scrollController.addListener(_onScroll);
    // _photoBloc = BlocProvider.of<PhotoBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (
        context,
        PhotoState state,
      ) {
        if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GetNewPhotosState) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  // color: Colors.yellow,
                  child: GridView.builder(
                    // controller: _scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                    ),
                    itemCount: state.photos.length + 1,
                    itemBuilder: (_, i) {
                      print(i + 1);
                      if (i + 2 >= state.photos.length) {
                        BlocProvider.of<PhotoBloc>(context).add(
                          GetNewPhotosEvent(
                            category: state.category,
                          ),
                        );
                      }
                      if (i >= state.photos.length)
                        return BottomCircularIndicator();
                      return InkWell(
                        onTap: () => Navigator.push(
                          _,
                          MaterialPageRoute(
                            builder: (_) => DetailScreen(
                              photo: state.photos[i],
                            ),
                          ),
                        ),
                        child: Container(
                          // color: Colors.yellow,
                          child: Hero(
                            tag: state.photos[i].id,
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
                                state.photos[i].src.tiny,
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

  // void _onScroll() {
  //   final maxScroll = _scrollController.position.maxScrollExtent;
  //   final currentScroll = _scrollController.position.pixels;
  //   if (maxScroll - currentScroll <= _scrollThreshold) {
  //     _photoBloc.add(
  //       GetNewPhotosEvent(category: 'nature'),
  //     );
  //   }
  // }
}

class BottomCircularIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
