import 'package:flutter/material.dart';

class QYDashLine extends StatelessWidget {
  const QYDashLine({
    super.key,
    this.axis = Axis.horizontal, // 虚线的方向
    required this.lineCount, // 线段个数
    this.lineWidth = 1, // 每条线段的宽度
    this.lineHeight = 1, // 每条线段的高度
    this.lineColor = Colors.black12, // 线段颜色
  });

  final Axis axis;
  final Color lineColor;
  final double lineWidth;
  final double lineHeight;
  final int lineCount;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        lineCount,
        (_) => SizedBox(
          width: lineWidth,
          height: lineHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(color: lineColor),
          ),
        ),
      ),
    );
  }
}
