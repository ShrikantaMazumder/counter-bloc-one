import 'dart:async';

import 'package:flutter_bloc/bloc/counter/counter_event.dart';

class CounterBloc {
  /// StreamController to handle event stream
  final _eventController = StreamController<CounterEvent>();
  Stream<CounterEvent> get eventStream => _eventController.stream;
  Sink<CounterEvent> get eventSink => _eventController.sink;

  /// StreamController to handle counter stream
  final _counterController = StreamController<int>();
  Stream<int> get counterStream => _counterController.stream;
  Sink<int> get counterSink => _counterController.sink;

  /// counter init value
  int _counter = 0;

  CounterBloc(){
    eventStream.listen((CounterEvent event) {
      if(event == CounterEvent.Increment) {
        _counter++;
        counterSink.add(_counter);
      }
      if(event == CounterEvent.Decrement) {
        _counter--;
        counterSink.add(_counter);
      }
    });
  }



  void dispose() {
    _eventController.close();
    _counterController.close();
  }
}