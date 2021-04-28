import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:live_scores/Viewmodels/fixtureViewModel.dart';
import 'package:live_scores/pages/fixturePage.dart';
import 'package:live_scores/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'Viewmodels/liveScoreViewModel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(),
  )
      // MyApp()
      );
  // uncomment to use your emulator directly);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig()..init(constraints);
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
    });
  }
}
