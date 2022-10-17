import 'package:flutter/material.dart';
import './res/gridData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter App")),
        body: const GridViewFromBuilder(),
      ),
    );
  }
}

// builder SliverGridDelegateWithFixedCrossAxisCount
class GridViewFromBuilder extends StatelessWidget {
  const GridViewFromBuilder({Key? key}) : super(key: key);

  Widget _initGridViewData(context, index) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
      child: Column(
        children: [
          Image.network(gridData[index]["imageUrl"]),
          const SizedBox(height: 10),
          Text(gridData[index]["title"], style: const TextStyle(fontSize: 15))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: gridData.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 10, //水平子Widget之间间 距
          mainAxisSpacing: 10, //垂直子Widget之间间 距
          childAspectRatio: 0.9,
          maxCrossAxisExtent: 120,
        ),
        itemBuilder: _initGridViewData);
  }
}

// GridView.count 实现动态列表
class DynamicGridFromCount extends StatelessWidget {
  const DynamicGridFromCount({super.key});

  List<Widget> _getGridData() {
    var res = gridData.map(((value) {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400, width: 1)),
        child: Column(
          children: <Widget>[
            Image.network(value["imageUrl"]),
            const SizedBox(height: 12),
            Text(
              value['title'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            )
          ],
        ),
      );
    }));

    return res.toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: const EdgeInsets.all(5),
      children: _getGridData(),
    );
  }
}

// GridView.count 其他属性
class GridViewFromCount2 extends StatelessWidget {
  const GridViewFromCount2({super.key});

  List<Widget> _initGridData() {
    List<Widget> list = [];
    for (var i = 0; i < 6; i++) {
      list.add(Container(
        alignment: Alignment.center,
        color: Colors.blue,
        child: Text(
          "这是第$i条数据",
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.8, // 宽高比
      crossAxisSpacing: 20, // 水平间距
      mainAxisSpacing: 20, // 垂直间距
      // scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(10),
      children: _initGridData(),
    );
  }
}

// GridView.extent maxCrossAxisExtent 表示每个item的最大宽度
class GridViewFromExtent extends StatelessWidget {
  const GridViewFromExtent({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 120,
      children: const [
        Icon(Icons.pedal_bike),
        Icon(Icons.home),
        Icon(Icons.ac_unit),
        Icon(Icons.search),
        Icon(Icons.settings),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.circle),
      ],
    );
  }
}

// GridView.count 表示一行最大数量
class GridViewFromCount extends StatelessWidget {
  const GridViewFromCount({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5, //一行的Widget数量
      children: const [
        Icon(Icons.pedal_bike),
        Icon(Icons.home),
        Icon(Icons.ac_unit),
        Icon(Icons.search),
        Icon(Icons.settings),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.circle),
      ],
    );
  }
}
