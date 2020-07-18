import 'package:flutter/material.dart';
import 'package:live_scores/model/liveScore.dart';
import 'package:live_scores/webServices/liveScore.dart';

class LiveScoreViewModel extends ChangeNotifier {
  List<LiveScoreModel> liveScoreList = List<LiveScoreModel>();

  void getLiveScores() async {
    List<LiveScoreModel> liveScoreItem =
        await LiveScoreServices.getLiveScoreList();
    this.liveScoreList = liveScoreItem
        .map((item) => LiveScoreModel(
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
            score: item.score,
            events: item.events))
        .toList();
    notifyListeners();
  }
}
