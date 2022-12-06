import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:urartist/controller/services.dart';

import '../../../../utils/global_colors.dart';

import 'package:vibration/vibration.dart';

class EditTextFieldNameArtist extends StatefulWidget {
  final Map<String, dynamic>? nombre;
  const EditTextFieldNameArtist({super.key, this.nombre});

  @override
  State<EditTextFieldNameArtist> createState() => _InputEditState();
}

class _InputEditState extends State<EditTextFieldNameArtist> {
  TextEditingController _textEditingController = TextEditingController();
  bool usernameStatus = false;
  bool vibration = false;
  bool statusDisplay = false;
  bool tapValidWrite = false;
  String typeInput = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController.text = widget.nombre!["name_artistic"];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        appBar: AppBar(
          title: const Text("Nombre de usuario"),
          backgroundColor: GlobalColor.primary,
          actions: [
            IconButton(
                onPressed: () async {
                  if (usernameStatus) {
                    Vibration.vibrate(amplitude: 128);
                    setState(() {
                      vibration = true;
                      tapValidWrite = true;
                    });
                  }else{
                    final response = await ApiServices().updateTextField(
                      {
                        "name" : _textEditingController.text
                      },
                      widget.nombre!["id"]
                      );
                    if (response == StatusAccount.successfully) {
                      
                    }

                    if (response == StatusAccount.serviceUnavailable) {
                      
                    }

                    if (response == StatusAccount.badGateway) {
                      
                    }
                    if (response == StatusAccount.errorTimeOut) {
                      
                    }
                  }
                },
                icon: const Icon(Icons.check))
          ],
        ),
        body: vibration
            ? SlideInLeft(
                controller: (p0) {
                  p0.addListener(() {
                    if (p0.isCompleted) {
                      setState(() {
                        vibration = false;
                      });
                    }
                  });
                },
                child: inputUser(size, false),
              )
            : inputUser(size, true));
  }

  Column inputUser(Size size, statusAnimationErrorText) {
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.12,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                blurRadius: 2,
                spreadRadius: 2,
                color: Colors.grey.withOpacity(0.1))
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  "Cambiar nombre de usuario",
                  style: TextStyle(
                      color: GlobalColor.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TextField(
                  controller: _textEditingController,
                  onChanged: (value) {
                    print(value);
                    verificarUsername(value);
                  },
                  decoration: const InputDecoration(
                      hintText: "Escribe nuevo nombre",
                      border: InputBorder.none),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              !tapValidWrite
                  ? statusAnimationErrorText
                      ? usernameStatus
                          ? FlipInY(
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 10),
                                child: Text(
                                  "El nombre de usuario debe ser mayor a 3 y menor a 15",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )
                          : Container()
                      : const Padding(
                          padding:
                              EdgeInsets.only(left: 15, right: 15, top: 10),
                          child: Text(
                            "El nombre de usuario debe ser mayor a 3 y menos a 15",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w500),
                          ),
                        )
                  : const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Text(
                        "El nombre de usuario debe ser mayor a 3 y menos a 15",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w500),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text:
                            "El nombre de usuario debe ser Unico y legible en ",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 14)),
                    TextSpan(
                        text: "UrArtist ",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            "esto para que las personas puedan encontrarte mas facilmente y no pueda haber nombres repetidos de bandas",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8), fontSize: 14))
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text:
                            "Tu puedes usar letras con numeros para el nombre de usuario ",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 14)),
                    TextSpan(
                        text: "a-z 0-9.",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: Text("Minimo debe contener 3 letras y maximo 15",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8), fontSize: 14)),
              )
            ],
          ),
        )
      ],
    );
  }

  void verificarUsername(String value) {
    if (value.length < 3 || value.length > 15) {
      setState(() {
        usernameStatus = true;
        statusDisplay = true;
        tapValidWrite = false;
      });
    } else if (value.length > 3) {
      setState(() {
        usernameStatus = false;
        tapValidWrite = false;
      });
    }
  }
}
