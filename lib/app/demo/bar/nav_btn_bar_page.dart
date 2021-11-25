import 'package:flutter/material.dart';
import 'package:flutter_getx/app/demo/bar/custom_animated_bottom_bar.dart';

class NavigatorBottomBarPage extends StatefulWidget {
  const NavigatorBottomBarPage({Key? key}) : super(key: key);

  @override
  _NavigatorBottomBarPageState createState() => _NavigatorBottomBarPageState();
}

class _NavigatorBottomBarPageState extends State<NavigatorBottomBarPage> {
  List<String> titles = ['首页', '搜索', '排名', '直播'];
  int _currentIndex = 0;
  Color backgroundColor = Colors.white;//Color(0xff050b18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('NavigatorBottomBar'),
      ),
      body: Center(
        child: InkWell(
          child: Text(
            titles[_currentIndex],
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
          ),
          onTap: ()=>{},
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: CustomAnimatedBottomBar(
          isRippleEffect: true,
          backgroundColor: backgroundColor,
          selectedIndex: _currentIndex,
          containerHeight: 56,
          onItemSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          onItemDoubleTap: (index){
            if(index == _currentIndex)
              print("double tap:${index}");
          },
          items: [
            BottomNavigatorBarItem(
                icon: Icon(Icons.home),
                title: Text(titles[0],textAlign: TextAlign.center),
                activeColor: Color(0xfff4d144),
                inactiveColor: Colors.grey,
                textAlign: TextAlign.center,
            ),
            BottomNavigatorBarItem(
              icon: Icon(Icons.search),
              title: Text(titles[1]),
              activeColor: Colors.greenAccent,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
            ),
            BottomNavigatorBarItem(
              icon: Icon(Icons.apps),
              title: Text(titles[2]),
              activeColor: Colors.pink,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
            ),
            BottomNavigatorBarItem(
              icon: Icon(Icons.video_camera_front),
              title: Text(titles[3]),
              activeColor: Colors.blueAccent,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
