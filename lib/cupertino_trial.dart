import 'package:flutter/cupertino.dart';
import 'package:new_dicoding_newsapp/cupertino_search_page.dart';
import 'package:new_dicoding_newsapp/cupertino_setting_page.dart';
import 'package:new_dicoding_newsapp/home_cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemOrange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(tabBar: CupertinoTabBar(items: const [
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.news), label: 'Feeds'),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: 'Find'),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings), label: 'Settings'),


    ]), tabBuilder: (context, index) {
      switch (index) {
        case 0:
          return const HomeFeeds();
        case 1:
          return const SearchPage();
        case 2:
          return const SettingPage();
        default:
          return const Center(child: Text('Page not found'));
      }
    });
  }
}

