import 'package:flutter/material.dart';
import 'package:live_scores/model/fixtures.dart';
import 'package:live_scores/webServices/fixtures.dart';

class FixtureViewModel extends ChangeNotifier {
  List<Response> fixtureList = List<Response>();

  void getFixtures() async {
    FixtureModel fixtureItem = await FixtureServices.getFixturesList();
    this.fixtureList = fixtureItem.response
        .map((item) => Response(
              fixture: item.fixture,
              goals: item.goals,
              league: item.league,
              score: item.score,
              teams: item.teams,
            ))
        .toList();
    notifyListeners();
  }
}
