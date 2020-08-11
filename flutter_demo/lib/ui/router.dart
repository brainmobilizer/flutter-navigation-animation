import 'package:flutter/material.dart';
import 'package:flutter_demo/core/models/album.dart';
import 'package:flutter_demo/core/models/photo.dart';
import 'package:flutter_demo/ui/routes.dart';
import 'package:flutter_demo/ui/views/feed/feed_navigation_view.dart';
import 'package:flutter_demo/ui/views/explore/explore_navigation_view.dart';
import 'package:flutter_demo/ui/views/account/account_navigation_view.dart';
import 'package:flutter_demo/ui/views/album/album_view.dart';
import 'package:flutter_demo/ui/views/photo/photo_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Uri uri = Uri.parse(settings.name);
    switch (uri.path) {
      case Routes.FEED:
        print('Feed: ' + uri.path);
        return MyCustomRoute<void>(
            settings: settings,
            builder: (_) => FeedNavigationView());
      case Routes.EXPLORE:
        print('Explore: ' + uri.path);
        return MyCustomRoute<void>(
            settings: settings,
            builder: (_) => ExploreNavigationView());
      case Routes.ACCOUNT:
        print('Account: ' + uri.path);
        return MyCustomRoute<void>(
            settings: settings,
            builder: (_) => AccountNavigationView());
      case Routes.ALBUM:
        print('Parent Album: ' + uri.path);
        Album album = settings.arguments as Album;
        return MaterialPageRoute<void>(
            settings: settings,
            builder: (_) => AlbumView(album: album));
      case Routes.PHOTO:
        print('Parent Photo: ' + uri.path);
        Photo photo = settings.arguments as Photo;
        return MaterialPageRoute<void>(
            settings: settings,
            builder: (_) => PhotoView(photo: photo));
      default:
        print('Parent Default: ' + uri.path);
        return MyCustomRoute<void>(
          settings: settings,
          builder: (_) => FeedNavigationView()
        );
    }
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    Animation<double> customAnimation = CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn);
    return new FadeTransition(
      opacity: customAnimation,
      child: child);
  }
}