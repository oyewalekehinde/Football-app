import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class EventsScreen extends StatelessWidget {
  final List events;
  final String homeName;
  final String awayName;
  final String homeLogo;
  final String awayLogo;
  final String status;
  final int timeElapsed;
  final int homeGoal;
  final int awayGoal;
  final int homeTeam;
  final int awayTeam;
  EventsScreen(
      {this.events,
      this.homeTeam,
      this.awayTeam,
      this.homeName,
      this.awayName,
      this.awayGoal,
      this.awayLogo,
      this.homeGoal,
      this.homeLogo,
      this.timeElapsed,
      this.status});
  Widget type(
      {String data,
      String playerName,
      String assistName,
      String details,
      int teamId}) {
    String type = data;
    switch (type) {
      case 'Goal':
        return Container(
          child: Row(
            mainAxisAlignment: homeTeam == teamId
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: <Widget>[
            details == 'Normal Goal' || details == 'Penalty'
                    ?   Image.asset(
                details == 'Normal Goal'
                    ? 'assets/images/goal.png'
                    : 'assets/images/penalty.png',
                height: 20,
                width: 20,
              ): Image.asset('assets/images/owngoal.png',
               height: 20,
                width: 20,),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: playerName + '\n',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: assistName != null ? assistName : '',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                            fontWeight: FontWeight.w200),
                      ),
                    ]),
                  ),
                ],
              ),
            ],
          ),
        );
        break;
      case 'Card':
        return Container(
          child: Row(
            mainAxisAlignment: homeTeam == teamId
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 10,
                width: 7,
                color: details == 'Red Card' ? Colors.red : Colors.yellow,
              ),
              SizedBox(
                width: 10,
              ),
              Text(playerName),
            ],
          ),
        );
        break;
      case 'subst':
        return Container(
          child: Row(
            mainAxisAlignment: homeTeam == teamId
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/images/subst.png',
                height: 20,
                width: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Out: ' + playerName),
                  Text('In: ' + assistName),
                ],
              ),
            ],
          ),
        );
        break;
      default:
        Container(
          child: Center(
            child: Text(type),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              color: Colors.black12,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    
                    children: <Widget>[
                      Container(
                          height: 50,
                          width: 50,
                          child: Image.network(homeLogo)),
                      Text(homeName)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('$timeElapsed'),
                      Row(
                        children: <Widget>[
                          Text('$homeGoal - '),
                          Text('$awayGoal')
                        ],
                      ),
                      Text(status),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          height: 50,
                          width: 50,
                          child: Image.network(awayLogo)),
                      Text(awayName)
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: this.events.length,
                  itemBuilder: (context, index) {
                    final list = this.events[index];
                    return TimelineTile(
                      indicatorStyle: IndicatorStyle(
                        drawGap: true,
                        width: 50,
                        height: 40,
                        indicator: Container(
                          decoration: BoxDecoration(
                              border: Border.fromBorderSide(
                                BorderSide(color: Colors.grey),
                              ),
                              shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              '${list['elapsed']}\'',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      alignment: TimelineAlign.center,
                      rightChild: awayTeam == list['team_id']
                          ? type(
                              data: list['type'],
                              playerName: list['player'],
                              assistName: list['assist'],
                              details: list['detail'])
                          : Container(
                              height: 80,
                              width: 100,
                            ),
                      leftChild: homeTeam == list['team_id']
                          ? type(
                              data: list['type'],
                              playerName: list['player'],
                              assistName: list['assist'],
                              details: list['detail'],
                              teamId: list['team_id'])
                          : Container(
                              height: 80,
                              width: 100,
                            ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
