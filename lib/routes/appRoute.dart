import 'package:flutter/material.dart';
import 'package:urartist/pages/screens/artista/edit_info_list.dart';
import 'package:urartist/pages/screens/artista/home_page_artist.dart';
import 'package:urartist/pages/screens/artista/perfil_artista.dart';
import 'package:urartist/pages/screens/artista/profile_artist.dart';
import 'package:urartist/pages/screens/artista/uploadPhotoandVideo.dart';
import 'package:urartist/pages/screens/buscador/buscador.dart';
import 'package:urartist/pages/screens/comunidad/edit_info_list.dart';
import 'package:urartist/pages/screens/comunidad/home_page_comunidad.dart';
import 'package:urartist/pages/screens/dashboard-artista/dashboard.dart';
import 'package:urartist/pages/screens/dashboard-artista/dashboard_artist.dart';
import 'package:urartist/pages/screens/dashboard-artista/dashboard_huerfano.dart';
import 'package:urartist/pages/screens/huerfano/edit_info_list.dart';
import 'package:urartist/pages/screens/huerfano/home_page_huerfano.dart';
import 'package:urartist/pages/screens/login/login.dart';
import 'package:urartist/pages/screens/perfil-artista/perfil_artista.dart';
import 'package:urartist/pages/screens/perfil-huerfano/edit_profile_huerfano.dart';
import 'package:urartist/pages/screens/perfil-huerfano/input_edit.dart';
import 'package:urartist/pages/screens/perfil-huerfano/perfil_huerfano.dart';
import 'package:urartist/pages/screens/presentacion/presentacion.dart';
import 'package:urartist/pages/screens/signUp/signUp.dart';
import 'package:urartist/pages/screens/splashscreen/splashscreen.dart';

class AppRoute {
  static const initialRoute = "profile_artist";

  static Map<String, Widget Function(BuildContext)> routes = {
    "buscador": (_) => const Buscador(),
    "splash": (_) => const SplashScreen(),
    //
    "login": (_) => const Login(),
    "presentation": (_) => const Presentation(),
    "signUp": (_) => const SignUp(),
    "home-page-community": (_) => const HomePageCommunity(),
    "home-page-artist": (_) => const HomePageArtist(),
    "home-page-huerfano": (_) => const HomePageHuerfano(),
    "edit-info-list-community": (_) =>  EditInfoListCommunity(),
    "edit-info-list-artist": (_) =>  EditInfoListArtist(),
    "edit-info-list-huerfano": (_) =>  EditInfoListHuerfano(),
    "upload-file": (_) => const UploadFile(),
    "perfil-artist" : (_) => const PerfilArtistav2(),
    "perfil-artist-view-client" : (_) => const PerfilArtistav2(),
    "profile_artist" : (_) => ProfileArtist()

  };
}
