import 'package:flutter/material.dart';
import 'package:live_scores/Viewmodels/fixtureViewModel.dart';
import 'package:live_scores/pages/LiveScorePage.dart';
import 'package:live_scores/utils/size_config.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fixture = Provider.of<FixtureViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_box),
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => LiveScoreScreen()));
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
                              item.league.country + '-' + item.league.name,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: SizeConfig.textSizeMultiplier * 5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: SizeConfig.widthMultiplier * 10),
                            Container(
                                height: SizeConfig.heightMultiplier * 4,
                                width: SizeConfig.heightMultiplier * 4,
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.heightMultiplier * 4),
                                    child: Image.network(item.league.logo))),
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
                                    child: Image.network(item.teams.home.logo)),
                                Text(item.teams.home.name)
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(item.fixture.status.elapsed.toString()),
                                Row(
                                  children: <Widget>[
                                    Text('${item.goals.home} - '),
                                    Text('${item.goals.away}')
                                  ],
                                ),
                                Text(item.fixture.status.short),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                    height: 50,
                                    width: 50,
                                    child: Image.network(item.teams.away.logo)),
                                Text(item.teams.away.name)
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('${item.fixture.venue.name}' + '\t\t'),
                            Text('${item.fixture.referee}')
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
