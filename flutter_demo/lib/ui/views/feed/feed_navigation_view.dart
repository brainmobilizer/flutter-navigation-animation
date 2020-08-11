import 'package:flutter/material.dart';
import 'package:flutter_demo/core/models/photo.dart';
import 'package:flutter_demo/ui/views/feed/feed_view.dart';
import 'package:flutter_demo/ui/views/photo/photo_view.dart';
import 'package:flutter_demo/ui/widgets/bottom_navbar.dart';
import 'package:flutter_demo/ui/routes.dart';

class FeedNavigationView extends StatefulWidget {
  @override
  _FeedNavigationViewState createState() => _FeedNavigationViewState();
}

class _FeedNavigationViewState extends State<FeedNavigationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (RouteSettings settings) {
          Uri uri = Uri.parse(settings.name);
          print('Feed Nav: ' + uri.path);
          switch (uri.path) {
            case Routes.FEED:
              return MaterialPageRoute<void>(
                  settings: settings,
                  builder: (_) => FeedView());
            case Routes.PHOTO:
              Photo photo = settings.arguments as Photo;
              return MaterialPageRoute<void>(
                  settings: settings,
                  builder: (_) => PhotoView(photo: photo));
            default:
              return MaterialPageRoute<void>(builder: (_) => FeedView());
          }
        },
      ),
      bottomNavigationBar: BottomNavBar(0),
    );
  }
}