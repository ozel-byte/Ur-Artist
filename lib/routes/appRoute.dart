import 'package:flutter/material.dart';
import 'package:urartist/pages/screens/buscador/buscador.dart';
import 'package:urartist/pages/screens/dashboard-artista/dashboard.dart';
import 'package:urartist/pages/screens/dashboard-artista/dashboard_artist.dart';
import 'package:urartist/pages/screens/dashboard-artista/dashboard_huerfano.dart';
import 'package:urartist/pages/screens/login/login.dart';
import 'package:urartist/pages/screens/perfil-artista/perfil_artista.dart';
import 'package:urartist/pages/screens/perfil-huerfano/edit_profile_huerfano.dart';
import 'package:urartist/pages/screens/perfil-huerfano/input_edit.dart';
import 'package:urartist/pages/screens/perfil-huerfano/perfil_huerfano.dart';
import 'package:urartist/pages/screens/presentacion/presentacion.dart';
import 'package:urartist/pages/screens/signUp/signUp.dart';
import 'package:urartist/pages/screens/splashscreen/splashscreen.dart';
class AppRoute {
  static const initialRoute = "presentation";

  static  Map<String, Widget Function(BuildContext)> routes = {
      "home" : (_) => const HomeComunidaad(),
      "home-artist" : (_) => const HomeArtista(),
      "profile-artist" : (_) => const PerfilArtista(),
      "home-huerfano" : (_) => const HomeHuerfano(),
      "profile-huerfano" : (_) => const PerfilHuerfano(),
      "buscador" : (_) => const Buscador(),
      "splash": (_) => const SplashScreen(),
      "edit-profile-h": (_) =>  EditProfileH(),
      "input-edit": (_) => const InputEdit(),
      "login": (_) => const Login(),
      "presentation": (_) => const Presentation(),
      "signUp": (_) => const SignUp()
  };

}