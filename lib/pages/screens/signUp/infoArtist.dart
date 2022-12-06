import 'package:flutter/material.dart';
import 'package:urartist/pages/screens/signUp/imgArtist.dart';
import 'package:urartist/pages/screens/signUp/viewLocation.dart';

import '../../../controller/validTextField.dart';
import '../../../utils/global_colors.dart';

class InfoArtist extends StatefulWidget {
  const InfoArtist({super.key});

  @override
  State<InfoArtist> createState() => _InfoArtistState();
}

class _InfoArtistState extends State<InfoArtist> {
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerUsernameContrasena =
      TextEditingController();
  final TextEditingController _controllerUsernameEmail =
      TextEditingController();
  final TextEditingController _controllerUsernameBio = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();

  bool statusMessageErrorUsername = false;
  bool statusMessageErrorPassword = false;
  bool statusMessageErrorEmail = false;
  bool statusMessageErrorBio = false;
  bool statusMessageErrorGps = false;
  bool statusMessageErrorNumber = false;
  String valueBio = "";
  String latitude = "Selecione su ubicacón";
  Map<String, dynamic>? userInfo;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informacion del Artista"),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Informacion",
                style: TextStyle(
                    color: GlobalColor.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Nombre Artistico"),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width * 0.88,
                    decoration: const BoxDecoration(
                      color: Color(0xffF7F7F7),
                    ),
                    child: TextField(
                      controller: _controllerUsername,
                      maxLength: 20,
                      onChanged: (value) {
                        if (ValidTextField().validUsername(value)) {
                          setState(() {
                            statusMessageErrorUsername = true;
                          });
                        } else {
                          setState(() {
                            statusMessageErrorUsername = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          counterText: statusMessageErrorUsername
                              ? "maximo 20 caracteres"
                              : "",
                          counterStyle: const TextStyle(color: Colors.red),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: statusMessageErrorUsername
                                      ? Colors.red
                                      : Color(0xffD9D9D9))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffD9D9D9))),
                          hintText: "Escriba su nombre"),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Contraseña"),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width * 0.88,
                    decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
                    child: TextField(
                      controller: _controllerUsernameContrasena,
                      maxLength: 10,
                      obscureText: true,
                      onChanged: (value) {
                        if (ValidTextField().validPassword(value)) {
                          setState(() {
                            statusMessageErrorPassword = true;
                          });
                        } else {
                          setState(() {
                            statusMessageErrorPassword = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          counterText: statusMessageErrorPassword
                              ? "Maximo 10 caracteres"
                              : "",
                          counterStyle: const TextStyle(color: Colors.red),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: statusMessageErrorPassword
                                      ? Colors.red
                                      : Color(0xffD9D9D9))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffD9D9D9))),
                          hintText: "Escriba su contraseña"),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Correo"),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width * 0.88,
                    decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
                    child: TextField(
                      controller: _controllerUsernameEmail,
                      onChanged: (value) {
                        if (ValidTextField().validEmail(value)) {
                          setState(() {
                            statusMessageErrorEmail = true;
                          });
                        } else {
                          setState(() {
                            statusMessageErrorEmail = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          counterText:
                              statusMessageErrorEmail ? "Correo invalido" : "",
                          counterStyle: const TextStyle(color: Colors.red),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: statusMessageErrorEmail
                                      ? Colors.red
                                      : Color(0xffD9D9D9))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffD9D9D9))),
                          hintText: "Escriba su correo"),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Bio"),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width * 0.88,
                    decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
                    child: TextField(
                      maxLines: 5,
                      controller: _controllerUsernameBio,
                      onChanged: (value) {
                        valueBio = value;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          counterText: "${valueBio.length}/150",
                          helperText: valueBio.length > 150
                              ? "Maximo 150 caracteres"
                              : "",
                          helperStyle: TextStyle(
                              color: valueBio.length >= 150
                                  ? Colors.red
                                  : Colors.grey),
                          counterStyle: TextStyle(
                              color: valueBio.length >= 150
                                  ? Colors.red
                                  : Colors.grey),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffD9D9D9))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffD9D9D9))),
                          hintText: "Escriba su biografia"),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ubicacion"),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final position =
                          await Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const ViewLocation();
                        },
                      ));
                      print(position);
                      setState(() {
                        latitude = position["latitude"] +
                            "  -  " +
                            position["longitude"];
                      });
                    },
                    child: Container(
                      width: size.width * 0.88,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.3)),
                          color: Color(0xffF7F7F7)),
                      child: Text(latitude),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Numero telefono"),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width * 0.88,
                    decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
                    child: TextField(
                      controller: _controllerPhone,
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        if (ValidTextField().validNumber(value)) {
                          setState(() {
                            statusMessageErrorNumber = true;
                          });
                        } else {
                          setState(() {
                            statusMessageErrorNumber = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          counterText: statusMessageErrorNumber
                              ? "Numero telefono invalido"
                              : "",
                          counterStyle: TextStyle(
                              color: statusMessageErrorNumber
                                  ? Colors.red
                                  : Colors.grey),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: statusMessageErrorNumber
                                      ? Colors.red
                                      : Color(0xffD9D9D9))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffD9D9D9))),
                          hintText: "Escriba un numero telefonico valido"),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("entro");
          if (_controllerUsername.text.isNotEmpty &&
              _controllerPhone.text.isNotEmpty &&
              _controllerUsernameBio.text.isNotEmpty &&
              _controllerUsernameContrasena.text.isNotEmpty &&
              _controllerUsernameEmail.text.isNotEmpty) {
            if (statusMessageErrorEmail ||
                statusMessageErrorUsername ||
                statusMessageErrorBio ||
                statusMessageErrorPassword ||
                latitude.isEmpty ||
                statusMessageErrorNumber) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Verifique sus campos")));
              }
            } else {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ImgArtist(
                    user: {
                      "name": _controllerUsername.text,
                      "password": _controllerUsernameContrasena.text,
                      "email": _controllerUsernameEmail.text,
                      "bio": _controllerUsernameBio.text,
                      "position": latitude,
                      "phone": _controllerPhone.text
                    },
                  );
                },
              ));
            }
          } else {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Faltan campos por llenar")));
            }
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
