import 'package:flutter/material.dart';
import 'package:flutter_project_230531/model/home_model.dart';
import 'package:flutter_project_230531/pages/home/home_list_item.dart';
import 'package:flutter_project_230531/service/home_request.dart';

class QYHomeBody extends StatefulWidget {
  const QYHomeBody({super.key});

  @override
  State<QYHomeBody> createState() => _QYHomeBodyState();
}

class _QYHomeBodyState extends State<QYHomeBody> {
  final List<HomeListItem> list = [];
  @override
  void initState() {
    super.initState();
    // https://www.freebuf.com/fapi/frontend/home/article?page=1&limit=20&type=1&day=7&category=%E7%B2%BE%E9%80%89
    QYHomeRequest.getList(1).then((res) {
      setState(() {
        list.addAll(res);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return QYHomeListItem(list[index]);
      },
    );
  }
}
