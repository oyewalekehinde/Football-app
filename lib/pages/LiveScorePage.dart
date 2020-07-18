import 'package:flutter/material.dart';
import 'package:live_scores/Viewmodels/liveScoreViewModel.dart';
import 'package:live_scores/pages/eventsPage.dart';
import 'package:provider/provider.dart';

class LiveScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final liveScore = Provider.of<LiveScoreViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('live-Score'),
      ),
      body: liveScore.liveScoreList.isEmpty
          ? Center(child: CircularProgressIndicator(
            backgroundColor: Colors.black,
            
          ))
          : ListView.builder(
              itemCount: liveScore.liveScoreList.length,
              itemBuilder: (context, index) {
                final item = liveScore.liveScoreList[index];
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EventsScreen(
                                events: item.events,
                                homeTeam: item.homeTeam['team_id'],
                                awayTeam: item.awayTeam['team_id'],
                              )));
                    },
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
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print('Button Clicked');

          liveScore.getLiveScores();
          //FixtureServices.getFixturesList();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
