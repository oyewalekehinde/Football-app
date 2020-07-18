import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class EventsScreen extends StatelessWidget {
  final List events;
  final int homeTeam;
  final int awayTeam;
  EventsScreen({this.events, this.homeTeam, this.awayTeam});
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
              CircleAvatar(
                minRadius: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Goal: ' + playerName),
                  assistName == null
                      ? Container()
                      : Text('Assist: ' + assistName),
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
              Icon(Icons.time_to_leave),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Out: ' + playerName),
                  assistName == null ? Container() : Text('In: ' + assistName),
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
        padding: EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: this.events.length,
            itemBuilder: (context, index) {
              final list = this.events[index];
              return TimelineTile(
                indicatorStyle: IndicatorStyle(
                  drawGap: true,
                  width: 60,
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
                        style: TextStyle(color: Colors.red),
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
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: <Widget>[
              //       TimelineTile(
              //           alignment: TimelineAlign.manual,
              //           lineX: 0.1,
              //           rightChild: Text('${list['elapsed']}\''),
              //           leftChild: Text('${list['elapsed']}\'')),
              //       list['elapsed_plus'] == null
              //           ? Container()
              //           : Text('+ ${list['elapsed_plus']}'),
              //       Text('\tPlayer : ${list['player']}  '),
              //       Text('${list['teamName']}  '),
              //       list['assist'] == null
              //           ? Container()
              //           : Text('Assist : ${list['assist']}  '),
              //       list['type'] == 'Goal'
              //           ? Icon(Icons.score)
              //           : Text('${list['type']}  '),
              // list['detail'] == 'Red Card' ||
              //         list['detail'] == 'Yellow Card'
              //     ? Container(
              //         height: 10,
              //         width: 7,
              //         color: list['detail'] == 'Red Card'
              //             ? Colors.red
              //             : Colors.yellow,
              //       )
              //           : Text('${list['detail']}  '),
              //     ],
              //   ),
              // );
            }),
      ),
    );
  }
}
