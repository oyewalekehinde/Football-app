class FixtureModel {
  FixtureModel({
    this.results,
    this.response,
  });

  final int results;
  final List<Response> response;

  factory FixtureModel.fromJson(Map<String, dynamic> json) => FixtureModel(
        results: json["results"] == null ? null : json["results"],
        response: json["response"] == null
            ? null
            : List<Response>.from(
                json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null ? null : results,
        "response": response == null
            ? null
            : List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Response {
  Response({
    this.fixture,
    this.league,
    this.teams,
    this.goals,
    this.score,
  });

  final Fixture fixture;
  final League league;
  final Team teams;
  final Goals goals;
  final Score score;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        fixture:
            json["fixture"] == null ? null : Fixture.fromJson(json["fixture"]),
        league: json["league"] == null ? null : League.fromJson(json["league"]),
        teams: json["teams"] == null ? null : Team.fromJson(json["teams"]),
        goals: json["goals"] == null ? null : Goals.fromJson(json["goals"]),
        score: json["score"] == null ? null : Score.fromJson(json["score"]),
      );

  Map<String, dynamic> toJson() => {
        "fixture": fixture == null ? null : fixture.toJson(),
        "league": league == null ? null : league.toJson(),
        "teams": teams == null ? null : teams.toJson(),
        "goals": goals == null ? null : goals.toJson(),
        "score": score == null ? null : score.toJson(),
      };
}

class Fixture {
  Fixture({
    this.id,
    this.referee,
    this.timezone,
    this.date,
    this.timestamp,
    this.periods,
    this.venue,
    this.status,
  });

  final int id;
  final dynamic referee;
  final String timezone;
  final DateTime date;
  final int timestamp;
  final Periods periods;
  final Venue venue;
  final Status status;

  factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
        id: json["id"] == null ? null : json["id"],
        referee: json["referee"],
        timezone: json["timezone"] == null ? null : json["timezone"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
        periods:
            json["periods"] == null ? null : Periods.fromJson(json["periods"]),
        venue: json["venue"] == null ? null : Venue.fromJson(json["venue"]),
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "referee": referee,
        "timezone": timezone == null ? null : timezone,
        "date": date == null ? null : date.toIso8601String(),
        "timestamp": timestamp == null ? null : timestamp,
        "periods": periods == null ? null : periods.toJson(),
        "venue": venue == null ? null : venue.toJson(),
        "status": status == null ? null : status.toJson(),
      };
}

class Periods {
  Periods({
    this.first,
    this.second,
  });

  final int first;
  final dynamic second;

  factory Periods.fromJson(Map<String, dynamic> json) => Periods(
        first: json["first"] == null ? null : json["first"],
        second: json["second"],
      );

  Map<String, dynamic> toJson() => {
        "first": first == null ? null : first,
        "second": second,
      };
}

class Status {
  Status({
    this.long,
    this.short,
    this.elapsed,
  });

  final String long;
  final String short;
  final int elapsed;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        long: json["long"] == null ? null : json["long"],
        short: json["short"] == null ? null : json["short"],
        elapsed: json["elapsed"] == null ? null : json["elapsed"],
      );

  Map<String, dynamic> toJson() => {
        "long": long == null ? null : long,
        "short": short == null ? null : short,
        "elapsed": elapsed == null ? null : elapsed,
      };
}

class Venue {
  Venue({
    this.id,
    this.name,
    this.city,
  });

  final int id;
  final String name;
  final String city;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        city: json["city"] == null ? null : json["city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "city": city == null ? null : city,
      };
}

class Goals {
  Goals({
    this.home,
    this.away,
  });

  final dynamic home;
  final dynamic away;

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        home: json["home"],
        away: json["away"],
      );

  Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
      };
}

class Team {
  Team({
    this.home,
    this.away,
  });

  final Away home;
  final Away away;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        home: json["home"] == null ? null : Away.fromJson(json["home"]),
        away: json["away"] == null ? null : Away.fromJson(json["away"]),
      );

  Map<String, dynamic> toJson() => {
        "home": home == null ? null : home.toJson(),
        "away": away == null ? null : away.toJson(),
      };
}

class Away {
  Away({
    this.id,
    this.name,
    this.logo,
    this.winner,
  });

  final int id;
  final String name;
  final String logo;
  final bool winner;

  factory Away.fromJson(Map<String, dynamic> json) => Away(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        logo: json["logo"] == null ? null : json["logo"],
        winner: json["winner"] == null ? null : json["winner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "logo": logo == null ? null : logo,
        "winner": winner == null ? null : winner,
      };
}

class League {
  League({
    this.id,
    this.name,
    this.country,
    this.logo,
    this.flag,
    this.season,
    this.round,
  });

  final int id;
  final String name;
  final String country;
  final String logo;
  final String flag;
  final int season;
  final String round;

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        country: json["country"] == null ? null : json["country"],
        logo: json["logo"] == null ? null : json["logo"],
        flag: json["flag"] == null ? null : json["flag"],
        season: json["season"] == null ? null : json["season"],
        round: json["round"] == null ? null : json["round"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "country": country == null ? null : country,
        "logo": logo == null ? null : logo,
        "flag": flag == null ? null : flag,
        "season": season == null ? null : season,
        "round": round == null ? null : round,
      };
}

class Score {
  Score({
    this.halftime,
    this.fulltime,
    this.extratime,
    this.penalty,
  });

  final Goals halftime;
  final Goals fulltime;
  final Goals extratime;
  final Goals penalty;

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        halftime:
            json["halftime"] == null ? null : Goals.fromJson(json["halftime"]),
        fulltime:
            json["fulltime"] == null ? null : Goals.fromJson(json["fulltime"]),
        extratime: json["extratime"] == null
            ? null
            : Goals.fromJson(json["extratime"]),
        penalty:
            json["penalty"] == null ? null : Goals.fromJson(json["penalty"]),
      );

  Map<String, dynamic> toJson() => {
        "halftime": halftime == null ? null : halftime.toJson(),
        "fulltime": fulltime == null ? null : fulltime.toJson(),
        "extratime": extratime == null ? null : extratime.toJson(),
        "penalty": penalty == null ? null : penalty.toJson(),
      };
}
