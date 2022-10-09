import 'package:flutter/material.dart';
import './res/listData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: const Text("Hello Flutter")),
          body: const DynamicListFromBuilder(),
        ));
  }
}

// listBuilder生成列表
class DynamicListFromBuilder extends StatelessWidget {
  const DynamicListFromBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listData.length,
      itemBuilder:(context, i) {
        return ListTile(
          leading: Image.network(listData[i]["imageUrl"]),
          title: Text(listData[i]["title"]),
          subtitle: Text(listData[i]["author"]),
        );
      },
    );
  }
}

// for 动态列表生成
class DynamicListFromFor extends StatelessWidget {
  const DynamicListFromFor({super.key});

  List<Widget> _initListView() {
    List<Widget> list = [];
    for (var i = 0; i < 10; i++) {
      list.add(
        ListTile(
          title: Text("我是一个列表 row$i"),
        )
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _initListView(),
    );
  }
}


// 水平列表 左右滑动
class HorizonListView extends StatelessWidget {
  const HorizonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox( // 使用SizedBox 限制高度
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 120,
            decoration: const BoxDecoration(color: Colors.red),
            child: Column(children: [
              Image.network("https://www.itying.com/images/flutter/1.png"),
              const Text("Hello")
            ]),
          ),
          Container(
            width: 120,
            decoration: const BoxDecoration(color: Colors.orange),
          ),
          Container(
            width: 120,
            decoration: const BoxDecoration(color: Colors.green),
          ),
          Container(
            width: 120,
            decoration: const BoxDecoration(color: Colors.pink),
          ),
          Container(
            width: 120,
            decoration: const BoxDecoration(color: Colors.cyan),
          ),
          Container(
            width: 120,
            decoration: const BoxDecoration(color: Colors.brown),
          ),
          Container(
            width: 120,
            decoration: const BoxDecoration(color: Colors.grey),
          ),
          Container(
            width: 120,
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          Container(
            width: 120,
            decoration: const BoxDecoration(color: Colors.amber),
          ),
        ],
      ),
    );
  }
}

// 图文列表
class AnotherListView extends StatelessWidget {
  const AnotherListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        Image.network("https://www.itying.com/images/flutter/1.png"),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
          height: 44,
          child: const Text("我是一个标题",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
        ),
        Image.network("https://www.itying.com/images/flutter/3.png"),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
          height: 44,
          child: const Text("我是一个标题",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
        ),
        Image.network("https://www.itying.com/images/flutter/2.png"),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
          height: 44,
          child: const Text("我是一个标题",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
        ),
        Image.network("https://www.itying.com/images/flutter/4.png"),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
          height: 44,
          child: const Text("我是一个标题",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
        ),
        Image.network("https://www.itying.com/images/flutter/5.png"),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
          height: 44,
          child: const Text("我是一个标题",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
        ),
        Image.network("https://www.itying.com/images/flutter/6.png"),
      ],
    );
  }
}

// 垂直图文列表
class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      children: <Widget>[
        ListTile(
          leading: Image.network("https://www.itying.com/images/flutter/1.png"),
          title: const Text('华北黄淮高温雨今起强势登场'),
          subtitle: const Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
        ),
        const Divider(),
        ListTile(
          leading: Image.network("https://www.itying.com/images/flutter/2.png"),
          title: const Text('保监局50天开32罚单 “断供”违规资金为房市降温'),
          subtitle: const Text("中国天气网讯 保监局50天开32罚单 “断供”违规资金为房市降温"),
        ),
        const Divider(),
        ListTile(
          trailing:
              Image.network("https://www.itying.com/images/flutter/1.png"),
          title: const Text('华北黄淮高温雨今起强势登场'),
          subtitle: const Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
        ),
        const Divider(),
        ListTile(
          leading: Image.network("https://www.itying.com/images/flutter/4.png"),
          title: const Text('普京现身俄海军节阅兵:乘艇检阅军舰'),
        ),
        const Divider(),
        ListTile(
          leading: Image.network("https://www.itying.com/images/flutter/5.png"),
          title: const Text('鸿星尔克捐1个亿帮助困难残疾群体 网友:企业有担当'),
        ),
        const Divider(),
        ListTile(
          leading: Image.network("https://www.itying.com/images/flutter/6.png"),
          title: const Text('行业冥灯?老罗最好祈祷苹果的AR能成'),
        ),
      ],
    );
  }
}

// 左边icon 右边文字
class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.home),
          title: Text("首页"),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.assignment, color: Colors.red),
          title: Text("全部订单"),
          trailing: Icon(Icons.chevron_right_sharp),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment, color: Colors.green),
          title: Text("待付款"),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.local_car_wash, color: Colors.orange),
          title: Text("待收货"),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.favorite_sharp, color: Colors.lightGreen),
          title: Text("我的收藏"),
          trailing: Icon(Icons.chevron_right_sharp),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.people, color: Colors.black54),
          title: Text("在线客服"),
          trailing: Icon(Icons.chevron_right_sharp),
        ),
        Divider(),
      ],
    );
  }
}
