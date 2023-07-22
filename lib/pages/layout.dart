import 'package:flutter/material.dart';
import 'home/home.dart';

class QYLayoutPage extends StatefulWidget {
  const QYLayoutPage({super.key});

  @override
  State<QYLayoutPage> createState() => _QYLayoutPageState();
}

class _QYLayoutPageState extends State<QYLayoutPage> {
  int _curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _curIndex,
        children: [QYHomePage(), Text('222')],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _curIndex,
        items: items(),
        onTap: (index) {
          setState(() {
            _curIndex = index;
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> items() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home),
        label: '首页',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.movie_creation_outlined),
        activeIcon: Icon(Icons.movie_creation),
        label: '书影音',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.group_add_outlined),
        activeIcon: Icon(Icons.group),
        label: '小组',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        activeIcon: Icon(Icons.person),
        label: '我的',
      )
    ];
  }
}
