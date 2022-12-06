import 'dart:async';

import 'package:flutter/material.dart';
import 'package:urartist/controller/saveUserSharedPreferences.dart';
import 'package:urartist/controller/services.dart';
import 'package:urartist/controller/streams/ButtonSignInStream.dart';
import 'package:urartist/controller/streams/DisplayValid.dart';
import 'package:urartist/controller/streams/NetworkStatusStream.dart';
import 'package:urartist/controller/validTextField.dart';
import 'package:urartist/pages/screens/signUp/typeUser.dart';
import 'package:urartist/utils/global_colors.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String nombre = "ozel";
  String password = "1234";

  String nombreArtista = "Mala racha";
  String passwordArtista = "1234";

  String nombreHuefano = "nelson";
  String passwordHuerfano = "1234";

  final TextEditingController _textEditingControllerNombre =
      TextEditingController();
  final TextEditingController _textEditingControllerPassword =
      TextEditingController();

  bool loading = false;

  ButtonSignInStream streamButton = ButtonSignInStream();
  NetworkStatusStream streamNetwork = NetworkStatusStream();
  DisplayValid streamDisplayValid = DisplayValid();
  StreamSubscription<ConnectivityResult>? subs;

  @override
  void initState() {
    super.initState();
    subs = Connectivity().onConnectivityChanged.listen((event) {
      print(event);
      if (event == ConnectivityResult.wifi) {
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   backgroundColor: Colors.green,
        //     behavior: SnackBarBehavior.floating,
        //     margin: const EdgeInsets.only(
        //         bottom: 20,
        //         right: 20,
        //         left: 20),
        //     content: Row(
        //       children: const [
        //         Icon(Icons.wifi_outlined,color: Colors.white,),
        //         Padding(
        //           padding: EdgeInsets.only(left: 10),
        //           child: Text("Conexion a internet"),
        //         ),
        //       ],
        //     )));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.only(
                bottom: 20,
                right: 20,
                left: 20),
            backgroundColor: Colors.red,
            content: Row(
              children: const [
                Icon(Icons.wifi_off,color: Colors.white,),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Sin conexion a internet"),
                ),
              ],
            )));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    subs!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.3,
            decoration: const BoxDecoration(
                color: GlobalColor.primary,
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("assets/fondo3.png"))),
            // child: const Padding(
            //   padding: const EdgeInsets.all(80.0),
            //   child: Image(

            //     image: AssetImage("assets/logo.png")),
            // ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: TextField(
                    controller: _textEditingControllerNombre,
                    onChanged: (value) {
                      if (!ValidTextField().validEmail(value) &&
                          _textEditingControllerPassword.text.isNotEmpty) {
                        streamButton.setStreamValue = true;
                      } else {
                        streamButton.setStreamValue = false;
                      }
                    },
                    decoration: const InputDecoration(
                        hintText: "Correo",
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: GlobalColor.primary))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: TextField(
                    controller: _textEditingControllerPassword,
                    obscureText: true,
                    onChanged: (value) {
                      if (value.isNotEmpty &&
                          !ValidTextField()
                              .validEmail(_textEditingControllerNombre.text)) {
                        streamButton.setStreamValue = true;
                      } else {
                        streamButton.setStreamValue = false;
                      }
                    },
                    decoration: const InputDecoration(
                        hintText: "Contraseña",
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: GlobalColor.primary))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text("¿Olvido su contraseña?"),
                    SizedBox(
                      width: 40,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                StreamBuilder<bool>(
                    initialData: false,
                    stream: streamButton.getStream,
                    builder: (context, AsyncSnapshot<bool> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!) {
                          return GestureDetector(
                            onTap: loading ? null : () {
                              login();
                            },
                            child: Container(
                                width: size.width * 0.8,
                                height: size.height * 0.07,
                                decoration: BoxDecoration(
                                    color: GlobalColor.primary,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                    child: loading
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : const Text(
                                            "Iniciar sesion",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ))),
                          );
                        } else {
                          return Container(
                              width: size.width * 0.8,
                              height: size.height * 0.07,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: loading
                                      ? const CircularProgressIndicator()
                                      : const Text(
                                          "Iniciar sesion",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )));
                        }
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    const Text("¿Añadir Nuevo Usuario? "),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, "signUp");
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const TypeUser();
                          },));
                        },
                        child: Container(
                          width: size.width * 0.5,
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              "Crear Cuenta",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  login() async {
    setState(() {
      loading = true;
    });
    final response = await ApiServices().login(
        _textEditingControllerNombre.text, _textEditingControllerPassword.text);
    setState(() {
      loading = false;
    });

    if (response["status"] == StatusAccount.successfully) {
      if (mounted) {
        if (response["type"] == "Artista") {
          SaveUserSharedPreferences().saveSignIn("home-page-artist");
          Navigator.pushReplacementNamed(context, "home-page-artist");
        } else if (response["type"] == "Cliente") {
          SaveUserSharedPreferences().saveSignIn("home-page-community");
          print("entro aqui en el stream");
          Navigator.pushReplacementNamed(context, "home-page-community");
        }
      }
    } 

    if (response["status"] == StatusAccount.serviceUnavailable) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("El servidor no responde, intentelo mas tarde")));
      }
    }
    if (response["status"] == StatusAccount.badGateway) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Gateway")));
      }
    }
    if (response["status"] == StatusAccount.errorCredential) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Error de credenciales")));
      }
    }

    if (response["status"] == StatusAccount.error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Error")));
      }
    }
  }
}
