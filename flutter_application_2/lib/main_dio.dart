import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("hahahah")),
        body: const DioTest(),
      ),
    ));

class DioTest extends StatefulWidget {
  const DioTest({super.key});

  @override
  State<DioTest> createState() => _DioTestState();
}

class _DioTestState extends State<DioTest> {
  final Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder(
        future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Response? response = snapshot.data;
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (response == null) {
              return const Text("response is null");
            } else {
              debugPrint(response.data.toString());
              return ListView(
                children: response.data
                    .map<Widget>((e) => ListTile(title: Text(e["full_name"])))
                    .toList(),
              );
            }
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
