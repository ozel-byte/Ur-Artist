import 'package:flutter/material.dart';
import 'package:urartist/pages/screens/dashboard-artista/dashboard.dart';
import 'package:urartist/pages/screens/perfil-artista/perfil_artista.dart';
import 'package:urartist/pages/screens/perfil-artista/perfil_artista_vista_user.dart';
import 'package:urartist/pages/screens/perfil-huerfano/perfil_huerfano.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: PerfilHuerfano(),
    );
  }
}