import 'package:flutter/material.dart';
import 'package:flutter_demo/core/models/album.dart';
import 'package:flutter_demo/core/models/photo.dart';
import 'package:flutter_demo/ui/views/explore/explore_view.dart';
import 'package:flutter_demo/ui/views/album/album_view.dart';
import 'package:flutter_demo/ui/views/photo/photo_view.dart';
import 'package:flutter_demo/ui/widgets/bottom_navbar.dart';
import 'package:flutter_demo/ui/routes.dart';

class ExploreNavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (RouteSettings settings) {
          Uri uri = Uri.parse(settings.name);
          print('Explore Nav: ' + uri.path);
          switch (uri.path) {
            case Routes.EXPLORE:
              return MaterialPageRoute<void>(
                  settings: settings,
                  builder: (_) => ExploreView());
            case Routes.ALBUM:
              Album album = settings.arguments as Album;
              return MaterialPageRoute<void>(
                  settings: settings,
                  builder: (_) => AlbumView(album: album));
            case Routes.PHOTO:
              Photo photo = settings.arguments as Photo;
              return MaterialPageRoute<void>(
                  settings: settings,
                  builder: (_) => PhotoView(photo: photo));
            default:
              return MaterialPageRoute<void>(
                  settings: settings,
                  builder: (_) => ExploreView());
          }
        },
      ),
      bottomNavigationBar: BottomNavBar(1),
    );
  }
}