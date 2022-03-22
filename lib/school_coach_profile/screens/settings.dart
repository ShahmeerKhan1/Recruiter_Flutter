import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Settings'),
      ),
    );
  }
}
