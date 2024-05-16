

import 'dart:async';

class TestHomeViewModel {

  TestHomeViewModel() {
    init();
  }

  StreamController<int> get streamController => _streamController;
  Stream<int> get stream => _stream;

  final StreamController<int> _streamController = StreamController<int>.broadcast();


  late final Stream<int> _stream;

  int _state = 0;

  int set (int data) => _state = data;

  void init(){
    _stream = _streamController.stream;
    _stream.listen((event) {
      print('===== ${event}');
      _state = event;
    });
  }


  void updateValue() async {
    var getData = _state;
    getData++;
    _streamController.sink.add(getData);
  }

}