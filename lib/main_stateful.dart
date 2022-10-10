import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DynamicAddListView(),
    );
  }
}

class DynamicAddListView extends StatefulWidget {
  const DynamicAddListView({super.key});

  @override
  State<DynamicAddListView> createState() => _DynamicAddListViewState();
}

class _DynamicAddListViewState extends State<DynamicAddListView> {
  final List<String> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _list.add("列表");
          });
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
          children: _list.map(((value) {
        return ListTile(title: Text(value));
      })).toList()),
    );
  }
}

/*
Counter
 */
class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$count", style: Theme.of(context).textTheme.headline2),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                child: const Text("添加"))
          ],
        ),
      ),
    );
  }
}
