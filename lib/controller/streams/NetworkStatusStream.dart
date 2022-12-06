import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkStatusStream{

  StreamController<ConnectivityResult>? streamController = StreamController<ConnectivityResult>.broadcast();


  get getStream => streamController!.stream;

  set setConnectivity(connectivityResult ){
    streamController!.sink.add(connectivityResult);
  }
}