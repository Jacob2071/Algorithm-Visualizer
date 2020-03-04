import 'package:flutter/material.dart';

import 'data.dart';

class VisualizerContainer extends StatelessWidget {
  const VisualizerContainer({
    Key key,
    @required this.height,
    @required this.width,
    @required this.size,
    @required this.numbers,
  }) : super(key: key);

  final double height;
  final double width;
  final int size;
  final List<int> numbers;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.71,
      color: Colors.grey[300],
      child: StreamBuilder<Object>(
        stream: streamController.stream,
        initialData: numbers,
        builder: (context, snapshot) {
          int counter = 0;
          List<int> numbers = snapshot.data;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: numbers.map(
              (int number) {
                counter++;
                return Container(
                  child: CustomPaint(
                    painter: BarPainter(
                      width: width,
                      value: number,
                      index: counter,
                    ),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}

class BarPainter extends CustomPainter {
  final double width;
  final int value;
  final int index;

  BarPainter({this.width, this.value, this.index});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    var baseColor = 0xFF300FB5;
    int colorOffset = 860000;
    paint.color = Color(baseColor + value + colorOffset);
    paint.strokeCap = StrokeCap.butt;
    paint.strokeWidth = width;
    canvas.drawLine(Offset(index * width, 0),
        Offset(index * width, 2.25 * value.ceilToDouble()), paint);
  }

  @override
  bool shouldRepaint(BarPainter oldDelegate) {
    return true;
  }
}
