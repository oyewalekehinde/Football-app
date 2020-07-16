import 'package:flutter/material.dart';
import 'package:live_scores/model/fixtures.dart';
import 'package:live_scores/webServices/fixtures.dart';

class FixtureViewModel extends ChangeNotifier {
  List<FixtureModel> fixtureList = List<FixtureModel>();

  void getFixtures() async {
    List<FixtureModel> fixtureItem = await FixtureServices.getFixturesList();
    this.fixtureList = fixtureItem
        .map((item) => FixtureModel(
            fixtureId: item.fixtureId,
            leagueId: item.leagueId,
            league: item.league,
            eventDate: item.eventDate,
            eventTimeStamp: item.eventTimeStamp,
            firstHalfStart: item.firstHalfStart,
            secondHalfStart: item.secondHalfStart,
            round: item.round,
            status: item.status,
            statusShort: item.statusShort,
            elapsed: item.elapsed,
            venue: item.venue,
            referee: item.referee,
            homeTeam: item.homeTeam,
            awayTeam: item.awayTeam,
            goalsHomeTeam: item.goalsHomeTeam,
            goalsAwayTeam: item.goalsAwayTeam,
            score: item.score))
        .toList();
    notifyListeners();
  }
}
