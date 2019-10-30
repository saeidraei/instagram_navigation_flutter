import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/scheduler.dart';

class MainPage extends StatefulWidget {
  MainPage({
    Key key,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  _MainPageState();

  int _currentIndex = 0;
  var pageController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final tabsNavigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: onWillPop,
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            activeColor: Theme.of(context).buttonColor,
            onTap: onTabTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text(''),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                ),
                title: Text(''),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket),
                title: Text(''),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled),
                title: Text(''),
              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            assert(index >= 0 && index <= 3);
            switch (index) {
              case 0:
                return CupertinoTabView(
                  navigatorKey: tabsNavigatorKeys[index],
                  builder: (BuildContext context) => Container(
                    child: Text(index.toString()),
                  ),
                );
                break;
              case 1:
                return CupertinoTabView(
                  navigatorKey: tabsNavigatorKeys[index],
                  builder: (BuildContext context) => Container(
                    child: Text(index.toString()),
                  ),
                );
                break;
              case 2:
                return CupertinoTabView(
                  navigatorKey: tabsNavigatorKeys[index],
                  builder: (BuildContext context) => Container(
                    child: Text(index.toString()),
                  ),
                );
                break;
              case 3:
                return CupertinoTabView(
                  navigatorKey: tabsNavigatorKeys[index],
                  builder: (BuildContext context) => Container(
                    child: Text(index.toString()),
                  ),
                );
                break;
            }
            return null;
          },
        ),
      ),
    );
  }

  GlobalKey<NavigatorState> currentNavigatorKey() {
    return tabsNavigatorKeys[_currentIndex];
  }

  Future<bool> onWillPop() async {
    return !await currentNavigatorKey().currentState.maybePop();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

void main() => runApp(MainPage());
