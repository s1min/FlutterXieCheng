import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  final _imageUrls = [
    'https://dimg04.c-ctrip.com/images/zg0o170000011epgxCF79.jpg',
    'https://dimg04.c-ctrip.com/images/zg0r160000010fv100337.jpg',
    'https://dimg04.c-ctrip.com/images/zg0j1700000115s8g588B.jpg',
    'https://dimg04.c-ctrip.com/images/zg0i14000000x2vdd389A.png'
  ];
  double appBarAlpha = 0;

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // `Stack` 实现叠放，前面的叠在下面后面的叠在上面
      body: Stack(
        children: <Widget>[
          // 移除顶部的 `padding`
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            // 监听滚动
            child: NotificationListener(
              onNotification: (scrollNotification) {
                // 当滚动了且是 `ListView` 滚动时才执行
                if (scrollNotification is ScrollUpdateNotification
                  && scrollNotification.depth == 0) {
                  _onScroll(scrollNotification.metrics.pixels);
                }
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 160,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(_imageUrls[index], fit: BoxFit.fill);
                      },
                      itemCount: _imageUrls.length,
                      autoplay: true,
                      pagination: SwiperPagination()
                    )
                  ),
                  Container(
                    height: 800,
                    child: ListTile(
                      title: Text('这是列表'),
                    ),
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('首页'),
                ),
              ),
            ),
          )
        ]
      )
    );
  }
  
}