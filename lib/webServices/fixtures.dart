import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:live_scores/model/fixtures.dart';

class FixtureServices {
  static Future<FixtureModel> getFixturesList() async {
    // final url = 'https://v2.api-football.com/fixtures/rounds/524/current';
    // final url = 'https://v2.api-football.com/fixtures/league/524/2020-07-16';

    var url = Uri.parse('https://v3.football.api-sports.io/fixtures?live=all');
    final response = await http.get(url, headers: {
      "x-rapidapi-host": "v3.football.api-sports.io",
      "x-rapidapi-key": "bb91af7f43a27c5a281a010ff44b4f95",
    });
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return FixtureModel.fromJson(result);
    } else {
      print(response.body);
      throw Exception('unable to get fixtures');
    }
  }
}
