import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/pages/home_page.dart';
import 'package:flutter_xiecheng/pages/my_page.dart';
import 'package:flutter_xiecheng/pages/search_page.dart';
import 'package:flutter_xiecheng/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
  
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _controller = PageController(
    initialPage: 0
  );
  int _currentIndex = 0;
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          MyPage(),
          SearchPage(),
          TravelPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _defaultColor),
            activeIcon: Icon(Icons.home, color: _activeColor),
            title: Text('首页', style: TextStyle(color: _currentIndex == 0 ? _activeColor : _defaultColor))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: _defaultColor),
            activeIcon: Icon(Icons.search, color: _activeColor),
            title: Text('搜索', style: TextStyle(color: _currentIndex == 1 ? _activeColor : _defaultColor))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt, color: _defaultColor),
            activeIcon: Icon(Icons.camera_alt, color: _activeColor),
            title: Text('旅拍', style: TextStyle(color: _currentIndex == 2 ? _activeColor : _defaultColor))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: _defaultColor),
            activeIcon: Icon(Icons.account_circle, color: _activeColor),
            title: Text('我的', style: TextStyle(color: _currentIndex == 3 ? _activeColor : _defaultColor))
          )
        ],
      ),
    );
  }

}