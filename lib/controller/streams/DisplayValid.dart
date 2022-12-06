

import 'dart:async';

class DisplayValid {

  static final DisplayValid _displayValid = DisplayValid._internal();

  factory DisplayValid(){
    return _displayValid;
  }

  DisplayValid._internal();
  StreamController<String>? streamController = StreamController<String>.broadcast();

  set setStreamValue(value){
    print("debio aver entrado aqui");
    streamController!.sink.add(value);
  }
  get getStream => streamController!.stream;
}