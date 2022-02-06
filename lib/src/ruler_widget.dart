import 'package:flutter/material.dart';

class RulerWidget extends StatefulWidget {
  /// total numbers on scale
  final int limit;

  /// starting number of scale to show marker
  final int lowerLimit;

  /// ending number of scale  to show marker
  final int upperLimit;

  /// mid starting number of scale (Optional)
  final int midLimitLower;

  /// mid ending number of scale (Optional)
  final int midLimitUpper;

  /// number of small bars of scale
  final int interval;

  /// number color of bars of scale
  final Color normalBarColor;

  /// color between lowerLimit and upperLimit bars of scale (Optional)
  final Color inRangeBarColor;

  /// color between midLimitUpper and upperLimit bars of scale (Optional)
  final Color outRangeBarColor;

  /// color between midLimitLower and lowerLimit bars of scale (Optional)
  final Color behindRangeBarColor;

  /// color of scale (Optional)
  final Color scaleColor;

  /// Custom Indicator over bars of scale (Optional)
  final Widget indicatorWidget;

  /// height of scale if horizontal or width of scale if vertical (Optional)
  final double scaleSize;

  /// Scale to be horizontal or vertical ,by default horizontal
  final Axis axis;

  final ScrollController? scrollController;

  const RulerWidget(
      {Key? key, this.limit = 100,
        this.scaleSize = 100,
        this.indicatorWidget = const SizedBox(),
        this.lowerLimit = 0,
        this.midLimitLower = 0,
        this.midLimitUpper = 0,
        this.upperLimit = 0,
        this.interval = 4,
        this.normalBarColor = Colors.black,
        this.scaleColor = Colors.white,
        this.inRangeBarColor = Colors.black,
        this.behindRangeBarColor = Colors.black,
        this.outRangeBarColor = Colors.black,
        this.scrollController,
        this.axis = Axis.horizontal}) : super(key: key);

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
      color: widget.scaleColor,
      height: widget.axis == Axis.horizontal ? widget.scaleSize : null,
      width: widget.axis == Axis.vertical ? widget.scaleSize : null,
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
    for (int i = 0; i < widget.limit; i++) {
      scaleWidgetList.add(RulerBar(
        key: ValueKey(i),
        num: i,
        type: RulerBar.BIG_BAR,
        lowerLimit: widget.lowerLimit,
        upperLimit: widget.upperLimit,
        indicatorWidget: widget.indicatorWidget,
        midLimitLower: widget.midLimitLower,
        midLimitUpper: widget.midLimitUpper,
        midInterval: widget.interval,
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

class RulerBar extends StatelessWidget {
  int type = 1;
  int num;

  static const int BIG_BAR = 1;
  static const int SMALL_BAR = 2;
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

  RulerBar(
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

  double spacing = 5.0;
  List<Widget> children = [];
  bool show = false;

  @override
  Widget build(BuildContext context) {
    _getSmallBars();
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  /// get color of small bar according to range
  Color _getSmallBarColor(int num) {
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
  Color _getBigBarColor(int num) {
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

    show = lowerLimit == num ||
        upperLimit == num ||
        midLimitLower == num ||
        midLimitUpper == num;

    children = [];

    children.add(
      Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          show
              ? indicatorWidget ?? Container()
          /*Text(
                  num.toString(),
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                )*/
              : Container(),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              margin: EdgeInsets.all(spacing),
              color: _getBigBarColor(num),
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
      children.add(Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          margin: EdgeInsets.all(spacing),
          color: _getSmallBarColor(num),
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
