import 'package:flutter/material.dart';
import 'package:rulers/rulers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              title: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

/*
As for Example only here
              * Limit is 24 as time in hours
              * interval 3 as 15,30,45 min
              *
              *
              * */

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rulers Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Normal Scale',
                  style: Theme.of(context).textTheme.title,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: RulerWidget(
                    scaleSize: 100,
                    scaleColor: Colors.grey[100],
                    indicatorWidget: Column(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    limit: 24,
                    interval: 3,
                    normalBarColor: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'In and Out Range Scale',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: RulerWidget(
                    scaleSize: 100,
                    scaleColor: Colors.grey[100],
                    indicatorWidget: Column(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    limit: 24,
                    interval: 3,
                    lowerLimit: 2,
                    midLimitLower: 2,
                    midLimitUpper: 6,
                    upperLimit: 6,
                    normalBarColor: Colors.grey,
                    inRangeBarColor: Colors.green,
                    behindRangeBarColor: Colors.orangeAccent,
                    outRangeBarColor: Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'In,Out,Mid Range Scale',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: RulerWidget(
                    scaleSize: 100,
                    scaleColor: Colors.yellow,
                    indicatorWidget: Column(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    limit: 24,
                    interval: 3,
                    lowerLimit: 2,
                    midLimitLower: 4,
                    midLimitUpper: 7,
                    upperLimit: 8,
                    normalBarColor: Colors.grey,
                    inRangeBarColor: Colors.green,
                    behindRangeBarColor: Colors.orangeAccent,
                    outRangeBarColor: Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Custom Marker Scale',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: RulerWidget(
                    scaleSize: 100,
                    scaleColor: Colors.blue[100],
                    indicatorWidget: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/marker.png',
                          color: Colors.red,
                          height: 25,
                          width: 25,
                        ),
                      ],
                    ),
                    limit: 24,
                    interval: 3,
                    lowerLimit: 2,
                    midLimitLower: 2,
                    midLimitUpper: 7,
                    upperLimit: 7,
                    normalBarColor: Colors.grey,
                    inRangeBarColor: Colors.green,
                    behindRangeBarColor: Colors.orangeAccent,
                    outRangeBarColor: Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Horizontal Scale',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  alignment: Alignment.centerLeft,
                  child: RulerWidget(
                    scaleColor: Colors.grey[100],
                    scaleSize: 100,
                    indicatorWidget: Column(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    limit: 20,
                    interval: 4,
                    lowerLimit: 0,
                    midLimitLower: 0,
                    midLimitUpper: 0,
                    upperLimit: 0,
                    normalBarColor: Colors.grey,
                    inRangeBarColor: Colors.green,
                    behindRangeBarColor: Colors.orangeAccent,
                    outRangeBarColor: Colors.red,
                    axis: Axis.vertical,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
