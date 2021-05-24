import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riverpod_hooks_sample/mydata.dart';

class MySlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<MyData>(context);
    return Slider(
      value: myData.value,
      onChanged: (value) => {myData.value = value},
    );
  }
}
