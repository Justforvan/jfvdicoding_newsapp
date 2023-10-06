import 'package:flutter/cupertino.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Search'),
        ),
        child: Center(
          child: Text('Search Page', style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,),
        ));
  }
}
