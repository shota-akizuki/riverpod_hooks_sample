import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_hooks_sample/mydata.dart';

//hooks_riverpodパターン

final _mydataProvider =
    StateNotifierProvider<MyData, double>((ref) => MyData());

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends HookWidget {
  MyHomePage({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final _value = useProvider(_mydataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "${_value.toStringAsFixed(2)}",
            style: TextStyle(fontSize: 100),
          ),
          Slider(
            value: _value,
            onChanged: (value) =>
                context.read(_mydataProvider.notifier).changeState(value),
          ),
        ],
      ),
    );
  }
}
