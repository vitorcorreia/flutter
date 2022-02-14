import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class SizeUtil {
  static const _DESIGN_WIDTH = 580;
  static const _DESIGN_HEIGHT = 648;

  //logic size in device
  static Size _logicSize = _logicSize;

  //device pixel radio.

  static get width {
    return _logicSize.width;
  }

  static get height {
    return _logicSize.height;
  }

  static set size(size) {
    _logicSize = size;
  }

  //@param w is the design w;
  static double getAxisX(double w) {
    return (w * width) / _DESIGN_WIDTH;
  }

// the y direction
  static double getAxisY(double h) {
    return (h * height) / _DESIGN_HEIGHT;
  }

  // diagonal direction value with design size s.
  static double getAxisBoth(double s) {
    return s *
        sqrt((width * width + height * height) /
            (_DESIGN_WIDTH * _DESIGN_WIDTH + _DESIGN_HEIGHT * _DESIGN_HEIGHT));
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;
    // if (backgroundColor != null) {
    //   final Paint backgroundPaint = Paint()
    //     ..color = backgroundColor!
    //     ..strokeWidth = strokeWidth
    //     ..style = PaintingStyle.stroke;
    //   canvas.drawArc(Offset.zero & size, 0, _sweep, false, backgroundPaint);
    // }

    // if (value == null) // Indeterminate
    //   paint.strokeCap = StrokeCap.square;
    // canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint)

    canvas.drawArc(Offset.zero & size, 0, (2 * pi), false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Gradient Demo',
        home: Scaffold(
          appBar: AppBar(
            title: Text("First Canvas"),
          ),
          body: Container(
              child: Center(
            child: Container(
              width: 250,
              height: 250.0,
              child: CustomPaint(
                painter: OpenPainter(),
              ),
            ),
          )),
        ));
  }
}
