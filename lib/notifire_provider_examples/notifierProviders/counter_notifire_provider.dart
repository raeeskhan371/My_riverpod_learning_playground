import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
);

class CounterNotifier extends Notifier<int> {
  // initilization
  @override
  int build() {
    int state = 0;
    return state;
  }

  // CounterIncrementation Function

  void increment() {
    state++;
    print(state);
  }

  // CounterDecremention Function
  void decrement() {
    state--;
    print(state);
  }
  // CountrtReset  Fucntion

  void reset() {
    state = 0;
    print(state);
  }
}
