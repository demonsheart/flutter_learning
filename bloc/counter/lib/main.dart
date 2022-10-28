import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:counter/app.dart';
import 'package:counter/counter_observer.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(const CounterApp());
}
