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
        body: const FlexTest2(),
      ),
    );
  }
}

// 垂直布局
// Row 要么使用子级的宽度，要么使用Expanded 和 Flexible 从而忽略子级的宽度。
// Row & Column继承自Flex
class FlexTest extends StatelessWidget {
  const FlexTest({super.key});

  @override
  Widget build(BuildContext context) {
    // 左边Expanded自适应宽度 右边固定宽度
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: IconContainer(Icons.home, color: Colors.red),
        ),
        IconContainer(Icons.shop, color: Colors.green),
      ],
    );

    // // 使用Expanded flex布局
    // return Flex(
    //   direction: Axis.horizontal,
    //   children: [
    //     Expanded(
    //       flex: 1,
    //       child: IconContainer(Icons.home, color: Colors.red),
    //     ),
    //     Expanded(
    //       flex: 2,
    //       child: IconContainer(Icons.shop, color: Colors.green),
    //     ),
    //   ],
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

// 一个更复杂一点的flex布局
class FlexTest2 extends StatelessWidget {
  const FlexTest2({super.key});

  @override
  Widget build(BuildContext context) {
    // 注意SizedBox的包裹 基于不同的上下文 需要指定height/width
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          color: Colors.grey,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 180,
                child: Image.network(
                    "https://www.itying.com/images/flutter/2.png",
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
                flex: 1,
                child: SizedBox(
                  height: 180,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: Image.network(
                                "https://www.itying.com/images/flutter/3.png",
                                fit: BoxFit.cover),
                          )),
                      const SizedBox(height: 10),
                      Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: Image.network(
                                "https://www.itying.com/images/flutter/4.png",
                                fit: BoxFit.cover),
                          )),
                    ],
                  ),
                )),
          ],
        )
      ],
    );
  }
}
