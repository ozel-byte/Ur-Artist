import 'package:flutter/material.dart';
import 'package:urartist/pages/screens/signUp/imgArtist.dart';
import 'package:urartist/pages/screens/signUp/imgUser.dart';
import 'package:urartist/pages/screens/signUp/viewLocation.dart';

import '../../../controller/validTextField.dart';
import '../../../utils/global_colors.dart';

class InfoUser extends StatefulWidget {
  const InfoUser({super.key});

  @override
  State<InfoUser> createState() => _InfoArtistState();
}

class _InfoArtistState extends State<InfoUser> {
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerUsernameContrasena =
      TextEditingController();
  final TextEditingController _controllerUsernameEmail =
      TextEditingController();
  final TextEditingController _controllerUsernameLastName =
      TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();

  bool statusMessageErrorUsername = false;
  bool statusMessageErrorPassword = false;
  bool statusMessageErrorEmail = false;
  bool statusMessageErrorNumber = false;
  bool statusMessageErrorLastName = false;
  String valueBio = "";
  Map<String, dynamic>? userInfo;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informacion del Usuario"),
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
                  const Text("Nombre"),
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
                  const Text("Apellidos"),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width * 0.88,
                    decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
                    child: TextField(
                      controller: _controllerUsernameLastName,
                      onChanged: (value) {
                        if (ValidTextField().validLastName(value)) {
                          setState(() {
                            statusMessageErrorLastName = true;
                          });
                        } else {
                          setState(() {
                            statusMessageErrorLastName = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          counterText: statusMessageErrorLastName
                              ? "Maximo 20 caracteres"
                              : "",
                          counterStyle: TextStyle(
                              color: statusMessageErrorLastName
                                  ? Colors.red
                                  : Colors.grey),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: statusMessageErrorLastName
                                      ? Colors.red
                                      : Color(0xffD9D9D9))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffD9D9D9))),
                          hintText: "Escriba su apellido"),
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
          if (_controllerUsername.text.isNotEmpty &&
              _controllerPhone.text.isNotEmpty &&
              _controllerUsernameLastName.text.isNotEmpty &&
              _controllerUsernameContrasena.text.isNotEmpty &&
              _controllerUsernameEmail.text.isNotEmpty) {
            if (statusMessageErrorEmail ||
                statusMessageErrorUsername ||
                statusMessageErrorLastName ||
                statusMessageErrorPassword ||
                statusMessageErrorNumber) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Verifique sus campos")));
              }
            } else {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ImgUser(
                    user: {
                      "name": _controllerUsername.text,
                      "password": _controllerUsernameContrasena.text,
                      "email": _controllerUsernameEmail.text,
                      "lastName": _controllerUsernameLastName.text,
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
