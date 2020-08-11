import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/routes.dart';

class BottomNavBarTitle extends StatelessWidget {
  final String _title;

  BottomNavBarTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 4.0), child: Text(_title)
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int _selectedIndex;

  BottomNavBar(this._selectedIndex);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.purple,
      selectedItemColor: Colors.white,
      selectedIconTheme: ThemeData.dark().iconTheme,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          title: BottomNavBarTitle('Feed'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: BottomNavBarTitle('Explore'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          title: BottomNavBarTitle('Account'),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.of(context).pushNamed(Routes.FEED);
            break;
          case 1:
            Navigator.of(context).pushNamed(Routes.EXPLORE);
            break;
          case 2:
            Navigator.of(context).pushNamed(Routes.ACCOUNT);
            break;
          default:
            print('BottomNav.onTap');
            print('unexpected index');
            print(index);
            print('/BottomNav.onTap');
        }
      }
    );
  }
}