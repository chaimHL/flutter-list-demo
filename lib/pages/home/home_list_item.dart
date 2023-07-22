import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project_230531/widgets/dash_line.dart';
import 'package:flutter_project_230531/widgets/rate.dart';
import '../../model/home_model.dart';

class QYHomeListItem extends StatelessWidget {
  const QYHomeListItem(this.item, {super.key});
  final HomeListItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 4, color: Colors.black12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildItemHeader(),
          SizedBox(height: 10),
          buildItemBody(),
          SizedBox(height: 12),
          buildItemFooter()
        ],
      ),
    );
  }

  // item 底部
  Container buildItemFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xffefefef),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(item.content ?? ''),
    );
  }

  // item 主体
  Row buildItemBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildItemBodyLeft(),
        SizedBox(width: 16),
        Expanded(
          // 让内部内容高度一致
          child: IntrinsicHeight(
            child: Row(
              children: [
                buildItemBodyMiddle(),
                SizedBox(width: 8),
                buildDashLine(),
                SizedBox(width: 8),
                buildItemBodyRight(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Container buildItemBodyRight() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.thumb_up_alt_outlined,
            color: Colors.amber,
          )
        ],
      ),
    );
  }

  // 虚线
  Container buildDashLine() {
    return Container(
      child: QYDashLine(
        lineCount: 20,
        lineWidth: 2,
        axis: Axis.vertical,
      ),
    );
  }

  // item 主体 - 中间信息
  Expanded buildItemBodyMiddle() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildItemBodyMiddleTitle(),
          SizedBox(height: 4),
          QYRate(
            Random().nextDouble() * 5,
            size: 20,
          )
        ],
      ),
    );
  }

  // item 主体 - 中间信息 - 头部标题
  Text buildItemBodyMiddleTitle() {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.redAccent,
            ),
          ),
          WidgetSpan(
            child: SizedBox(
              width: 4,
            ),
          ),
          TextSpan(text: item.postTitle, style: TextStyle(fontSize: 18))
        ],
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  // item 主体 - 图片
  ClipRRect buildItemBodyLeft() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8), // 圆角
      child: Image.network(
        item.postImage ?? '',
        width: 120,
      ),
    );
  }

  // item 头部
  Container buildItemHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        'ID: ${item.id}',
        style: TextStyle(
          color: Colors.brown,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
