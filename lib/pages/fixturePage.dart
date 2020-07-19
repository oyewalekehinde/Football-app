import 'package:flutter/material.dart';
import 'package:live_scores/Viewmodels/fixtureViewModel.dart';
import 'package:live_scores/pages/LiveScorePage.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fixture = Provider.of<FixtureViewModel>(context);
    // final liveScore = Provider.of<LiveScoreViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_box),
              onPressed: () {
                // liveScore.getLiveScores();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LiveScoreScreen()));
              }),
        ],
        title: Text('Football App'),
      ),
      body: ListView.builder(
        itemCount: fixture.fixtureList.length,
        itemBuilder: (context, index) {
          final item = fixture.fixtureList[index];
          return fixture.fixtureList.isEmpty
              ? CircularProgressIndicator()
              : Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              item.league['country'] +
                                  '-' +
                                  item.league['name'],
                            ),
                            Container(
                                height: 15,
                                width: 15,
                                child: Image.network(item.league['logo'])),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                    height: 50,
                                    width: 50,
                                    child:
                                        Image.network(item.homeTeam['logo'])),
                                Text(item.homeTeam['team_name'])
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(item.elapsed.toString()),
                                Row(
                                  children: <Widget>[
                                    Text('${item.goalsHomeTeam} - '),
                                    Text('${item.goalsAwayTeam}')
                                  ],
                                ),
                                Text(item.statusShort),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                    height: 50,
                                    width: 50,
                                    child:
                                        Image.network(item.awayTeam['logo'])),
                                Text(item.awayTeam['team_name'])
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('${item.venue}' + '\t\t'),
                            Text('${item.referee}')
                          ],
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print('Button Clicked');
          fixture.getFixtures();

          //FixtureServices.getFixturesList();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
