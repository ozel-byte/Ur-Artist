import 'dart:io';

import 'package:flutter/material.dart';
import 'package:urartist/controller/saveUserSharedPreferences.dart';
import 'package:urartist/controller/streams/DisplayValid.dart';
import 'package:urartist/pages/screens/dashboard-artista/dashboard.dart';
import 'package:urartist/pages/screens/perfil-artista/perfil_artista.dart';
import 'package:urartist/pages/screens/artista/perfil_artista.dart';
import 'package:urartist/pages/screens/perfil-huerfano/perfil_huerfano.dart';
import 'package:urartist/routes/appRoute.dart';

void main(){
   HttpOverrides.global = new MyHttpOverrides();
  runApp(
  const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<String>(
      future: SaveUserSharedPreferences().exists(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: snapshot.data,
          routes: AppRoute.routes,
        );
        }else{
          return const CircularProgressIndicator();
        }
      },
    );
  }
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}