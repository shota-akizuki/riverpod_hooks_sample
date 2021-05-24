import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_hooks_sample/mydata.dart';

//flutter_riverpodパターン

// 1.グローバル変数にProviderを設定
final _mydataProvider =
    StateNotifierProvider<MyData, double>((ref) => MyData());

void main() {
  // 2.ProviderScopeを設定
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

class MyHomePage extends StatelessWidget {
  MyHomePage({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // 3.ConsumerWidgetを使い、watchを使えるようにする
          Consumer(builder: (context, watch, child) {
            return Text(
              // 4.watch関数にプロバイダーを渡し、stateを取り出す
              "${watch(_mydataProvider).toStringAsFixed(2)}",
              style: TextStyle(fontSize: 100),
            );
          }),
          Consumer(builder: (context, watch, child) {
            return Slider(
              value: watch(_mydataProvider),
              // 5.context.readにプロバイダーのnotifierを与えて、メソッドを呼び出す
              onChanged: (value) =>
                  context.read(_mydataProvider.notifier).changeState(value),
            );
          }),
        ],
      ),
    );
  }
}
