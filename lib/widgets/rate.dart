import 'package:flutter/material.dart';

class QYRate extends StatefulWidget {
  QYRate(this.rate,
      {super.key,
      this.totalRate = 5,
      this.count = 5,
      this.size = 24,
      Widget? unselectIcon,
      Widget? selectIcon})
      : unselectIcon = unselectIcon ??
            Icon(Icons.star_border, color: Colors.orangeAccent, size: size),
        selectIcon = selectIcon ??
            Icon(
              Icons.star,
              color: Colors.orangeAccent,
              size: size,
            );

  final double rate; // 评分
  final double totalRate; // 满分
  final int count; // icon 个数
  final double size; // icon 大小
  final Widget unselectIcon; // 未选中的 icon
  final Widget selectIcon; // 选中的 icon

  @override
  State<QYRate> createState() => _QYRateState();
}

class _QYRateState extends State<QYRate> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildUnSelectList(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildSelectList(),
        ),
      ],
    );
  }

  // 构建选中的 icon
  List<Widget> buildSelectList() {
    // 一个 icon 代表的分数
    double oneIconScore = widget.totalRate / widget.count;

    // 当前分数应该有几个 icon 是完全填充的
    int fullIconCount = (widget.rate / oneIconScore).floor();

    // 当前分数小数部分换算成应该填充 icon 的宽度
    double clipWidth = (widget.rate - fullIconCount * oneIconScore) *
        widget.size /
        oneIconScore;

    // 完全填充的 icon
    Widget icon = widget.selectIcon;

    List<Widget> iconList = [];

    // 完全填充的 icon（也就是评分的整数部分）
    for (var i = 0; i < fullIconCount; i++) {
      iconList.add(icon);
    }

    // 部分填充的 icon（也就是评分的小数部分）
    iconList.add(ClipRect(
      child: icon,
      clipper: QYRateIconClipper(clipWidth),
    ));

    // 如果因为评分高于总分导致 icon 数量多于总个数
    if (iconList.length > widget.count) {
      return iconList.sublist(0, widget.count);
    }

    return iconList;
  }

  // 构建未选中的 icon
  List<Widget> buildUnSelectList() {
    return List.generate(
      widget.count,
      (index) => widget.unselectIcon,
    );
  }
}

class QYRateIconClipper extends CustomClipper<Rect> {
  QYRateIconClipper(this.clipWidth);
  double clipWidth;

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, clipWidth, size.height);
  }

  @override
  bool shouldReclip(QYRateIconClipper oldClipper) {
    return oldClipper.clipWidth != clipWidth;
  }
}
