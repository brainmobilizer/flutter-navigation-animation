import 'package:flutter/material.dart';
import 'package:flutter_demo/core/models/album.dart';
import 'package:flutter_demo/core/models/photo.dart';
import 'package:flutter_demo/ui/views/account/account_view.dart';
import 'package:flutter_demo/ui/views/album/album_view.dart';
import 'package:flutter_demo/ui/views/photo/photo_view.dart';
import 'package:flutter_demo/ui/widgets/bottom_navbar.dart';
import 'package:flutter_demo/ui/routes.dart';

class AccountNavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (RouteSettings settings) {
          Uri uri = Uri.parse(settings.name);
          print('Account Nav: ' + uri.path);
          switch (uri.path) {
            case Routes.ACCOUNT:
              return MaterialPageRoute<void>(
                  settings: settings,
                  builder: (_) => AccountView());
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
                  builder: (_) => AccountView());
          }
        },
      ),
      bottomNavigationBar: BottomNavBar(2),
    );
  }
}