import 'package:flutter/material.dart';
import 'package:live_scores/Viewmodels/fixtureViewModel.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    final fixture = Provider.of<FixtureViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Football App'),
      ),
      body: ListView.builder(
        itemCount: fixture.fixtureList.length,
        itemBuilder: (context, index) {
          final item = fixture.fixtureList[index];
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.network(item.homeTeam['logo']),
                  item.score['fulltime'] == null
                      ? Text('null')
                      : Text(item.score['fulltime']),
                  Image.network(item.awayTeam['logo']),
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
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
