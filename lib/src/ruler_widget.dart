import 'package:flutter/material.dart';

class RulerWidget extends StatefulWidget {
  /// total visible numbers on scale
  int largeScaleBarsInterval;

  /// starting number on scale to show marker [indicatorWidget]
  int lowerIndicatorLimit;

  /// ending number on scale  to show marker [indicatorWidget]
  final int upperIndicatorLimit;

  /// mid starting number on scale
  int lowerMidIndicatorLimit;

  /// mid ending number on scale
  int upperMidIndicatorLimit;

  /// number of small bars b/w two [largeScaleBarsInterval] on scale
  int smallScaleBarsInterval;

  /// color of bars on scale [largeScaleBarsInterval] and [smallScaleBarsInterval]
  final Color normalBarColor;

  /// color between [lowerMidIndicatorLimit] and [upperMidIndicatorLimit] bars of scale
  final Color inRangeBarColor;

  /// color between [upperMidIndicatorLimit] and [upperIndicatorLimit] bars of scale (Optional)
  final Color outRangeBarColor;

  /// color between [lowerMidIndicatorLimit] and [lowerIndicatorLimit] bars of scale (Optional)
  final Color behindRangeBarColor;

  /// color of scale
  Color scaleBackgroundColor;

  /// Custom Indicator over bars on scale
  Widget indicatorWidget = Container();

  /// height of scale if horizontal or width of scale if vertical
  final double height;

  /// Scale to be horizontal or vertical ,by default horizontal
  final Axis axis;

  final ScrollController? scrollController;

  RulerWidget(
      {Key? key,
      required this.height,
      required this.largeScaleBarsInterval,
      required this.smallScaleBarsInterval,
      required this.scaleBackgroundColor,
      required this.normalBarColor,
      this.indicatorWidget = const SizedBox(),
      this.lowerIndicatorLimit = 0,
      this.lowerMidIndicatorLimit = 0,
      this.upperMidIndicatorLimit = 0,
      this.upperIndicatorLimit = 0,
      this.inRangeBarColor = Colors.black,
      this.behindRangeBarColor = Colors.black,
      this.outRangeBarColor = Colors.black,
      this.scrollController,
      this.axis = Axis.horizontal})
      : super(key: key);

  @override
  _RulerWidgetState createState() => _RulerWidgetState();
}

class _RulerWidgetState extends State<RulerWidget> {
  late List<Widget> scaleWidgetList;

  @override
  void initState() {
    super.initState();

    scaleWidgetList = [];
    _generateScale();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.scaleBackgroundColor,
      height: widget.axis == Axis.horizontal ? widget.height : null,
      width: widget.axis == Axis.vertical ? widget.height : null,
      child: SingleChildScrollView(
        controller: widget.scrollController,
        scrollDirection: widget.axis,
        child: RotatedBox(
          quarterTurns: widget.axis == Axis.horizontal ? 4 : 3,
          child: Row(
            children: scaleWidgetList,
          ),
        ),
      ),
    );
  }

  void _generateScale() async {
    for (int i = 0; i < widget.largeScaleBarsInterval; i++) {
      print("_generateScale $i");
      scaleWidgetList.add(RulerBarWidget(
        key: ValueKey(i),
        num: i,
        type: RulerBar.BIG_BAR,
        lowerLimit: widget.lowerIndicatorLimit,
        upperLimit: widget.upperIndicatorLimit,
        indicatorWidget: widget.indicatorWidget,
        midLimitLower: widget.lowerMidIndicatorLimit,
        midLimitUpper: widget.upperMidIndicatorLimit,
        midInterval: widget.smallScaleBarsInterval,
        normalBarColor: widget.normalBarColor,
        inRangeBarColor: widget.inRangeBarColor,
        behindRangeBarColor: widget.behindRangeBarColor,
        outRangeBarColor: widget.outRangeBarColor,
        axis: widget.axis,
      ));
    }

    if (mounted) setState(() {});
  }
}

class RulerBarWidget extends StatelessWidget {
  final RulerBar type;

  int num;

  int midInterval;
  int lowerLimit;
  int upperLimit;
  int midLimitLower;
  int midLimitUpper;
  Color normalBarColor;
  Color inRangeBarColor;
  Color outRangeBarColor;
  Color behindRangeBarColor;
  Widget indicatorWidget;
  Axis axis;

  RulerBarWidget(
      {Key? key,
      required this.num,
      required this.type,
      required this.indicatorWidget,
      required this.lowerLimit,
      required this.midLimitLower,
      required this.midLimitUpper,
      required this.upperLimit,
      required this.midInterval,
      required this.normalBarColor,
      required this.inRangeBarColor,
      required this.behindRangeBarColor,
      required this.outRangeBarColor,
      required this.axis})
      : super(key: key);

  final double _spacing = 5.0;
  List<Widget> _children = List.empty(growable: true);
  bool _show = false;

  @override
  Widget build(BuildContext context) {
    if (_children.isEmpty) _getSmallBars();

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _children,
      ),
    );
  }

  /// get color of small bar according to range
  Color _getSmallBarColor() {
    if (_getScalePosition(num) >= _getScalePosition(lowerLimit) &&
        _getScalePosition(num) < _getScalePosition(midLimitLower))
      return behindRangeBarColor;
    else if (_getScalePosition(num) >= _getScalePosition(midLimitLower) &&
        _getScalePosition(num) < _getScalePosition(midLimitUpper))
      return inRangeBarColor;
    else if (_getScalePosition(num) > _getScalePosition(midLimitUpper) &&
        _getScalePosition(num) < _getScalePosition(upperLimit))
      return outRangeBarColor;
    else if (_getScalePosition(num) == _getScalePosition(midLimitUpper) &&
        _getScalePosition(num) < _getScalePosition(upperLimit))
      return outRangeBarColor;
    else if (_getScalePosition(num) == _getScalePosition(midLimitUpper) &&
        _getScalePosition(num) == _getScalePosition(upperLimit))
      return normalBarColor;
    else
      return normalBarColor;
  }

  /// get color of bigger bar according to range
  Color _getBigBarColor() {
    if (_getScalePosition(num) >= _getScalePosition(lowerLimit) &&
        _getScalePosition(num) < _getScalePosition(midLimitLower))
      return normalBarColor;
    else if (_getScalePosition(num) >= _getScalePosition(midLimitLower) &&
        _getScalePosition(num) <= _getScalePosition(midLimitUpper))
      return inRangeBarColor;
    else if (_getScalePosition(num) > _getScalePosition(midLimitUpper) &&
        _getScalePosition(num) <= _getScalePosition(upperLimit))
      return outRangeBarColor;
    else
      return normalBarColor;
  }

  void _getSmallBars() {
    num = num + 1;

    _show = lowerLimit == num ||
        upperLimit == num ||
        midLimitLower == num ||
        midLimitUpper == num;

    _children = List.empty(growable: true);

    _children.add(
      Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          _show ? indicatorWidget : Container(),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              margin: EdgeInsets.all(_spacing),
              color: _getBigBarColor(),
              width: 2,
              height: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Text(
              num.toString(),
              style: TextStyle(
                  fontSize: 14,
                  color: normalBarColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );

    for (int i = 1; i <= midInterval; i++) {
      _children.add(Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          margin: EdgeInsets.all(_spacing),
          color: _getSmallBarColor(),
          width: 2,
          height: 10,
        ),
      ));
    }
  }

  _getScalePosition(int num) {
    return num + (num - 1) * 3;
  }
}

enum RulerBar { BIG_BAR, SMALL_BAR }
