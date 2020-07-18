import 'package:flutter/material.dart';
import 'package:live_scores/Viewmodels/fixtureViewModel.dart';
import 'package:live_scores/pages/fixturePage.dart';
import 'package:provider/provider.dart';

import 'Viewmodels/liveScoreViewModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FixtureViewModel>(
          create: (_) => FixtureViewModel(),
        ),
        ChangeNotifierProvider<LiveScoreViewModel>(
            create: (_) => LiveScoreViewModel()),
      ],
      child: MaterialApp(title: 'Football-app', home: MyHomePage()),
    );
  }
}
