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
              headline3: TextStyle(
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
                  style: Theme.of(context).textTheme.headline3,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: RulerWidget(
                    totalScaleBars: 100,
                    scaleBackgroundColor: Colors.grey.shade200,
                    limit: 24,
                    smallScaleBarsInterval: 3,
                    normalBarColor: Colors.grey,
                    indicatorWidget: Column(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'In and Out Range Scale',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: RulerWidget(
                    totalScaleBars: 100,
                    scaleBackgroundColor: Colors.grey.shade100,
                    indicatorWidget: Column(
                      children: const <Widget>[
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    limit: 24,
                    smallScaleBarsInterval: 3,
                    lowerIndicatorLimit: 2,
                    lowerMidIndicatorLimit: 2,
                    upperMidIndicatorLimit: 6,
                    upperIndicatorLimit: 6,
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
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: RulerWidget(
                    totalScaleBars: 100,
                    scaleBackgroundColor: Colors.yellow,
                    indicatorWidget: Column(
                      children: const <Widget>[
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    limit: 24,
                    smallScaleBarsInterval: 3,
                    lowerIndicatorLimit: 2,
                    lowerMidIndicatorLimit: 4,
                    upperMidIndicatorLimit: 7,
                    upperIndicatorLimit: 8,
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
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: RulerWidget(
                    totalScaleBars: 100,
                    scaleBackgroundColor: Colors.blue.shade100,
                    indicatorWidget: Image.asset(
                      'assets/marker.png',
                      color: Colors.red,
                      height: 25,
                      width: 25,
                    ),
                    limit: 24,
                    smallScaleBarsInterval: 3,
                    lowerIndicatorLimit: 2,
                    lowerMidIndicatorLimit: 2,
                    upperMidIndicatorLimit: 7,
                    upperIndicatorLimit: 7,
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
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  alignment: Alignment.centerLeft,
                  child: RulerWidget(
                    scaleBackgroundColor: Colors.grey.shade100,
                    totalScaleBars: 100,
                    indicatorWidget: Column(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    limit: 20,
                    smallScaleBarsInterval: 4,
                    lowerIndicatorLimit: 0,
                    lowerMidIndicatorLimit: 0,
                    upperMidIndicatorLimit: 0,
                    upperIndicatorLimit: 0,
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
