import 'package:flutter/material.dart';
import 'package:live_scores/Viewmodels/fixtureViewModel.dart';
import 'package:live_scores/pages/fixturePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football-app',
      home: ChangeNotifierProvider(
          create: (_) => FixtureViewModel(), child: MyHomePage()),
    );
  }
}
