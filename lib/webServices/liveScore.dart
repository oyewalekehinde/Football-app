import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:live_scores/model/liveScore.dart';

class LiveScoreServices {
  static Future<List<LiveScoreModel>> getLiveScoreList() async {
    final url = 'https://v2.api-football.com/fixtures/live';
    final response = await http.get(url, headers: {
      "x-rapidapi-host": "v2.api-football.com",
      "x-rapidapi-key": "bb91af7f43a27c5a281a010ff44b4f95",
    });
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print(result);
      Iterable list = result["api"]["fixtures"];
      return list.map((json) => LiveScoreModel.fromJson(json)).toList();
    } else {
      print(response.body);
      throw Exception('unable to get fixtures');
    }
  }
}
