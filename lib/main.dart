import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riverpod_hooks_sample/mydata.dart';
import 'package:riverpod_hooks_sample/slider.dart';

//Providerパターン

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MyData(),
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
          Consumer<MyData>(
            builder: (context, myData, _) => Text(
              myData.value.toStringAsFixed(2),
              style: TextStyle(fontSize: 100),
            ),
          ),
          MySlider(),
        ],
      ),
    );
  }
}
