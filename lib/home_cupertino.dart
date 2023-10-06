import 'package:flutter/cupertino.dart';

class HomeFeeds extends StatelessWidget {
  const HomeFeeds({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Feeds'),
        ),
        child: Center(
          child: Text('Feeds Page', style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,),
        ));
  }
}
