class LiveScoreModel {
  final int fixtureId;
  final int leagueId;
  final Map league;
  final String eventDate;
  final int eventTimeStamp;
  final int firstHalfStart;
  final int secondHalfStart;
  final String round;
  final String status;
  final String statusShort;
  final int elapsed;
  final String venue;
  final String referee;
  final Map homeTeam;
  final Map awayTeam;
  final int goalsHomeTeam;
  final int goalsAwayTeam;
  final Map score;
  final List events;

  LiveScoreModel(
      {this.fixtureId,
      this.leagueId,
      this.league,
      this.eventDate,
      this.eventTimeStamp,
      this.firstHalfStart,
      this.secondHalfStart,
      this.round,
      this.status,
      this.statusShort,
      this.elapsed,
      this.venue,
      this.referee,
      this.homeTeam,
      this.awayTeam,
      this.goalsHomeTeam,
      this.goalsAwayTeam,
      this.score,
      this.events});

  factory LiveScoreModel.fromJson(Map<dynamic, dynamic> json) {
    return LiveScoreModel(
        fixtureId: json["fixture_id"],
        leagueId: json["league_id"],
        league: json["league"],
        eventDate: json["event_date"],
        eventTimeStamp: json["event_timestamp"],
        firstHalfStart: json["firstHalfStart"],
        secondHalfStart: json["secondHalfStart"],
        round: json["round"],
        status: json["status"],
        statusShort: json["statusShort"],
        elapsed: json["elapsed"],
        venue: json["venue"],
        referee: json["referee"],
        homeTeam: json["homeTeam"],
        awayTeam: json["awayTeam"],
        goalsHomeTeam: json["goalsHomeTeam"],
        goalsAwayTeam: json["goalsAwayTeam"],
        score: json["score"],
        events: json["events"]);
  }
}
