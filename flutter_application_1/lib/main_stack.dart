import 'package:flutter/material.dart';

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
        body: const ListViewNComponent(),
      ),
    );
  }
}

// listView + 固定组件
class ListViewNComponent extends StatelessWidget {
  const ListViewNComponent({super.key});

  @override
  Widget build(BuildContext context) {
    //获取设备的宽度和高度
    final size =MediaQuery.of(context).size;
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.only(top: 50),
          children: const [
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
          ],
        ),
        Positioned(
            left: 0,
            top: 0,
            width: size.width, // 这里不能使用double.infinity
            height: 44,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.black,
                      child: const Text(
                        "二级导航",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
              ],
            ))
      ],
    );
  }
}

// position 定位
class PositionTest extends StatelessWidget {
  const PositionTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: Stack(
          //注意：相对于外部容器进行定位，如果没有外部容器就相对于整个屏幕进行定位
          children: [
            Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.yellow,
                )),
            const Positioned(top: 190, right: 0, child: Text("你好Flutter"))
          ],
        ),
      ),
    );
  }
}

// stack 简单使用
class SimpleStack extends StatelessWidget {
  const SimpleStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 400,
          height: 300,
          color: Colors.red,
        ),
        Container(
          width: 200,
          height: 200,
          color: Colors.yellow,
        ),
        const Text("Text1")
      ],
    );
  }
}
