import 'package:flutter/material.dart';
import './myIcon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: Scaffold(
            appBar: AppBar(title: const Text("Hello Flutter")),
            body: Column(
              children: const [
                // MySimpleImage(),
                SizedBox(
                  height: 20,
                ),
                // CirCleImageByContainer(),
                // CircleImageByClipOval(),
                // CirCleImageByAvatar(),
                // LocalImage(),

                // https://fonts.google.com/icons?selected=Material+Icons
                Icon(Icons.search, color: Colors.red, size: 40),
                SizedBox(height: 10),
                Icon(Icons.home),
                SizedBox(height: 10),
                Icon(Icons.category),

                // ALibaba
                SizedBox(height: 10),
                Icon(MyIconFont.wechat, size: 40, color: Colors.green),
                SizedBox(height: 10),
                Icon(MyIconFont.shop, size: 40),
              ],
            )));
  }
}

// 加载本地图片
class LocalImage extends StatelessWidget {
  const LocalImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
          child: Image.asset(
        "images/a.jpeg",
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      )),
    );
  }
}

// CircleAvatar实现圆形图片
class CirCleImageByAvatar extends StatelessWidget {
  const CirCleImageByAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      // 嵌套CircleAvatar实现边框
      radius: 65,
      backgroundColor: Color(0xFF42A5F5),
      child: CircleAvatar(
        radius: 60,
        backgroundImage: NetworkImage(
            "https://www.itying.com/themes/itying/images/ionic4.png"),
      ),
    );
  }
}

// ClipOval实现圆形图片
class CircleImageByClipOval extends StatelessWidget {
  const CircleImageByClipOval({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.network(
          "https://www.itying.com/themes/itying/images/ionic4.png",
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Container实现圆形图片
class CirCleImageByContainer extends StatelessWidget {
  const CirCleImageByContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(75),
          image: const DecorationImage(
              image: NetworkImage(
                  "https://www.itying.com/themes/itying/images/ionic4.png"),
              fit: BoxFit.cover)),
    );
  }
}

// 简单图片
class MySimpleImage extends StatelessWidget {
  const MySimpleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.centerRight,
      height: 200,
      width: 200,
      decoration: const BoxDecoration(
        color: Colors.yellow,
      ),
      // child: Image.network("https://www.itying.com/images/201906/goods_img/1120_P_1560842352183.png"), // 正方形
      child: Image.network(
        "https://www.itying.com/themes/itying/images/ionic4.png",
        // scale: 2,
        // alignment: Alignment.centerLeft,
        fit: BoxFit.cover,
        // repeat: ImageRepeat.repeatX,
      ),
    );
  }
}

// Text
class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      decoration: const BoxDecoration(color: Colors.yellow),
      child: const Text(
        "凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰凤求凰",
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: Colors.cyan,
          fontStyle: FontStyle.italic,
          letterSpacing: 6,
          decoration: TextDecoration.underline,
          decorationColor: Colors.pink,
          decorationStyle: TextDecorationStyle.dotted,
        ),
      ),
    );
  }
}

// container 实现 button效果
class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        // margin: const EdgeInsets.all(20),
        // padding: const EdgeInsets.all(20),
        // margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        height: 50,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(15)),
        child: const Text(
          "Button",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// 简单container
class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.amber,
          gradient: const LinearGradient(
            colors: [Colors.red, Colors.orange],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.blue,
              offset: Offset(2, 2),
              blurRadius: 10,
            )
          ],
          border: Border.all(color: Colors.black, width: 1),
        ),
        transform: Matrix4.rotationZ(.2),
        child: const Text(
          "Hello",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

// 你好 世界
class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Hello World",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40,
          color: Colors.black,
        ),
      ),
    );
  }
}
