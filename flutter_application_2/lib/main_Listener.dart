// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("hahahah")),
        body: const PonterMoveIndicator(),
      ),
    ));

class PonterMoveIndicator extends StatefulWidget {
  const PonterMoveIndicator({super.key});

  @override
  State<PonterMoveIndicator> createState() => _PonterMoveIndicatorState();
}

class _PonterMoveIndicatorState extends State<PonterMoveIndicator> {
  PointerEvent? _event;
  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 300.0,
        height: 150.0,
        child: Text(
          '${_event?.localPosition ?? ''}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      onPointerDown: (PointerDownEvent event) => setState(() => _event = event),
      onPointerMove: (PointerMoveEvent event) => setState(() => _event = event),
      onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
    );
  }
}
