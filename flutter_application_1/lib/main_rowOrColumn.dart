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
        body: const ColumnTest(),
      ),
    );
  }
}

// 垂直布局
class ColumnTest extends StatelessWidget {
  const ColumnTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black38,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconContainer(Icons.home, color: Colors.red),
          IconContainer(Icons.search, color: Colors.yellow),
          IconContainer(Icons.shop, color: Colors.green),
        ],
      ),
    );
  }
}

// 横向布局
class RowTest extends StatelessWidget {
  const RowTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black45,
      child: Row(
        // 如果外面有Container 则相对于Container布局 否则自适应
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconContainer(Icons.home, color: Colors.red),
          IconContainer(Icons.search, color: Colors.yellow),
          IconContainer(Icons.shop, color: Colors.green),
        ],
      ),
    );

    // return Padding(
    //   padding: const EdgeInsets.all(10), // 添加间距
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       IconContainer(Icons.home, color: Colors.red),
    //       IconContainer(Icons.search, color: Colors.yellow),
    //       IconContainer(Icons.shop, color: Colors.green),
    //     ],
    //   ),
    // );
  }
}

class IconContainer extends StatelessWidget {
  Color color;
  IconData icon;
  IconContainer(this.icon, {super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      width: 100,
      color: color,
      child: Icon(icon, color: Colors.white, size: 28),
    );
  }
}

// Padding: 将需要间距的组件用Padding包裹起来就行
class PaddingTest extends StatelessWidget {
  const PaddingTest({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // padding: const EdgeInsets.all(10),
      crossAxisCount: 2,
      childAspectRatio: 1,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.network('https://www.itying.com/images/flutter/1.png',
              fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.network('https://www.itying.com/images/flutter/2.png',
              fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.network('https://www.itying.com/images/flutter/3.png',
              fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.network('https://www.itying.com/images/flutter/4.png',
              fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.network('https://www.itying.com/images/flutter/5.png',
              fit: BoxFit.cover),
        ),
        Padding(
            padding: const EdgeInsets.all(10),
            child: Image.network('https://www.itying.com/images/flutter/6.png',
                fit: BoxFit.cover)),
      ],
    );
  }
}
