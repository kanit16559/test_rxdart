import 'package:rxdart/rxdart.dart';

import '../core/dispose.dart';

class HomeViewModel extends Dispose {

  BehaviorSubject<int> get countBehavior => _countBehavior;

  final BehaviorSubject<int> _countBehavior = BehaviorSubject<int>.seeded(0);

  @override
  void dispose() {
    _countBehavior.close();
  }

  void countDecrease(){
    int getValue = _countBehavior.value;
    if(getValue == 0) return;
    getValue--;
    _countBehavior.sink.add(getValue);
  }

  void countIncrement(){
    int getValue = _countBehavior.value;
    // int getValue = _countBehavior.stream.value;
    getValue++;
    _countBehavior.sink.add(getValue);
  }


}