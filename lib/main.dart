import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Hello Flutter")),
        body: const MyText(),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      decoration: const BoxDecoration(
        color: Colors.yellow
      ),
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
          decorationStyle: TextDecorationStyle.dashed,
        ),
      ),
    );
  }
}

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
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15)
        ),
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
