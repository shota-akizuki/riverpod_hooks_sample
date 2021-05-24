import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyData extends StateNotifier<double> {
  MyData() : super(0.5);
  void changeState(newState) => this.state = newState;
}
