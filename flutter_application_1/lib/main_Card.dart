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
        body: const AnotherCard(),
      ),
    );
  }
}

/*
Card
*/

class AnotherCard extends StatelessWidget {
  const AnotherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 20,
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                    "https://www.itying.com/images/flutter/3.png",
                    fit: BoxFit.cover),
              ),
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.itying.com/images/flutter/4.png"),
                ),
                title: Text("xxxxx"),
                subtitle: Text("zxxxxx"),
              )
            ],
          ),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 20,
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                    "https://www.itying.com/images/flutter/3.png",
                    fit: BoxFit.cover),
              ),
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.itying.com/images/flutter/4.png"),
                ),
                title: Text("xxxxx"),
                subtitle: Text("zxxxxx"),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CardTest extends StatelessWidget {
  const CardTest({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          shape: RoundedRectangleBorder(
              //Card???????????????
              borderRadius: BorderRadius.circular(10)),
          elevation: 20, //??????????????????
          margin: const EdgeInsets.all(10),
          child: Column(
            children: const [
              ListTile(
                title: Text("??????", style: TextStyle(fontSize: 28)),
                subtitle: Text("?????????????????????"),
              ),
              Divider(),
              ListTile(
                title: Text("?????????152222222"),
              ),
              ListTile(
                title: Text("??????????????????????????? xxx"),
              ),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
              //Card???????????????
              borderRadius: BorderRadius.circular(10)),
          elevation: 20,
          margin: const EdgeInsets.all(10),
          // color:Colors.black12,  //????????????
          child: Column(
            children: const [
              ListTile(
                title: Text("??????", style: TextStyle(fontSize: 28)),
                subtitle: Text("Flutter?????????????????????"),
              ),
              Divider(),
              ListTile(
                title: Text("?????????152222222"),
              ),
              ListTile(
                title: Text("??????????????????????????? xxx"),
              ),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
              //Card???????????????
              borderRadius: BorderRadius.circular(10)),
          elevation: 20, //??????????????????
          margin: const EdgeInsets.all(10),
          child: Column(
            children: const [
              ListTile(
                title: Text("??????", style: TextStyle(fontSize: 28)),
                subtitle: Text("?????????????????????"),
              ),
              Divider(),
              ListTile(
                title: Text("?????????152222222"),
              ),
              ListTile(
                title: Text("??????????????????????????? xxx"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/*
AspectRatio
*/

class SimpleAspect extends StatelessWidget {
  const SimpleAspect({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3, // ????????????3
      child: Container(color: Colors.red),
    );
  }
}

class AspectRatioTest extends StatelessWidget {
  const AspectRatioTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.yellow,
      child: AspectRatio(
        aspectRatio: 2, // ????????????2 ???????????????????????????100
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
