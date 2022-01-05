import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

progressIndicatior() {
  CircularPercentIndicator(
    radius:100,
    lineWidth: 5.0,
    animation: true,
    percent: 0.0,
    center: new Text('100%'),
    circularStrokeCap: CircularStrokeCap.round,
    progressColor: Colors.blueGrey,
  );
}
