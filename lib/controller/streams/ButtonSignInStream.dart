
import 'dart:async';

import 'package:urartist/controller/validTextField.dart';

class ButtonSignInStream{
  StreamController<bool>? streamController = StreamController<bool>();

 Stream<bool> get getStream => streamController!.stream;

  set setStreamValue(value){
    if (value) {
    streamController!.sink.add(true);
    }else{
    streamController!.sink.add(false);
    }
  }
}