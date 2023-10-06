import 'package:flutter/cupertino.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Settings'),
        ),
        child: Center(
          child: Text('Settings Page', style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,),
        ));
  }
}
