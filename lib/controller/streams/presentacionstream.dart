import 'dart:async';

class PresentacionStream {
  int index = 0;
  StreamController<int>? streamController = StreamController<int>.broadcast();

  set streamIndex(newIndex){
    streamController!.sink.add(newIndex);
  }
  get getStreamValue async => await streamController!.stream.first;

  Stream get  getStream => streamController!.stream;
}