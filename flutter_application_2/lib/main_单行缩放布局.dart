import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text("haha")),
      body: const Center(child: HomePage()),
    )));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          wRow(' 90000000000000000 '), // 超出屏幕
          FittedBox(
              child: wRow(' 90000000000000000 ')), // FittedBox contain 从而缩放
          wRow(' 800 '), // 宽度传递为屏幕宽度
          FittedBox(
              child: wRow(
                  ' 800 ')), // FittedBox把constraint重新修改为（0<=width<=double.infinity, 0<= height <=double.infinity） 无限时 Row 就会将子组件的宽度之和作为自己的宽度。
          SingleLineFittedBox(child: wRow('800')),
          SingleLineFittedBox(child: wRow(' 90000000000000000 ')),
        ]
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: e,
                ))
            .toList(),
      ),
    );
  }
}

// 单行缩放布局
class SingleLineFittedBox extends StatelessWidget {
  const SingleLineFittedBox({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return FittedBox(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minWidth: constraints
                  .maxWidth, // 将最小宽度（minWidth）约束指定为屏幕宽度，因为Row必须得遵守父组件的约束，所以 Row 的宽度至少等于屏幕宽度，所以就不会出现缩在一起的情况
              maxWidth:
                  double.infinity, // 将 maxWidth 指定为无限大，则就可以处理数字总长度超出屏幕宽度的情况。
            ),
            child: child,
          ),
        );
      },
    );
  }
}

// 直接使用Row 3个重复组件
Widget wRow(String text) {
  Widget child = Text(text);
  child = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [child, child, child],
  );
  return child;
}
