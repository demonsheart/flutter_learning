// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("hahahah")),
        body: const StreamTest(),
      ),
    ));

// 每隔1秒，计数加1
Stream<int> counter() {
  return Stream.periodic(const Duration(seconds: 1), (i) {
    return i;
  });
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}

class StreamTest extends StatefulWidget {
  const StreamTest({super.key});

  @override
  State<StreamTest> createState() => _StreamTestState();
}

class _StreamTestState extends State<StreamTest> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<int>(
        stream: counter(), //
        //initialData: ,// a Stream<int> or null
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('没有Stream');
            case ConnectionState.waiting:
              return Text('等待数据...');
            case ConnectionState.active:
              return Text('active: ${snapshot.data}');
            case ConnectionState.done:
              return Text('Stream 已关闭');
          }
        },
      ),
    );
  }
}

Future<String> mockNetworkData() async {
  return Future.delayed(const Duration(seconds: 2), () => "只因你太美");
}

class FutureTest extends StatefulWidget {
  const FutureTest({super.key});

  @override
  State<FutureTest> createState() => _FutureTestState();
}

class _FutureTestState extends State<FutureTest> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: mockNetworkData(),
        builder: ((context, snapshot) {
          // 该构建器会在Future执行的不同阶段被多次调用
          // 请求已结束
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text("Error: ${snapshot.error}");
            } else {
              // 请求成功，显示数据
              return Text("Contents: ${snapshot.data}");
            }
          } else {
            // 请求未结束，显示loading
            return const CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}
