import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../utils/global_colors.dart';

import 'package:vibration/vibration.dart';

class EditTextFieldUbiHuerfano extends StatefulWidget {
  final String? ubi;
   const EditTextFieldUbiHuerfano({super.key,this.ubi});

  @override
  State<EditTextFieldUbiHuerfano> createState() => _InputEditState();
}

class _InputEditState extends State<EditTextFieldUbiHuerfano> {
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
      _textEditingController.text = widget.ubi!;

  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
  
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        appBar: AppBar(
          title:  Text("Ubicación de usuario"),
          backgroundColor: GlobalColor.primary,
          actions: [
            IconButton(
                onPressed: () async {
                  if (usernameStatus) {
                   bool? statusviabra = await Vibration.hasAmplitudeControl();
                    if (!statusviabra!) {
                      Vibration.vibrate(amplitude: 128);
                    }
                    print("object");
                    setState(() {
                      vibration = true;
                      tapValidWrite = true;
                    });
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
             const  Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  "Cambiar ubicación de usuario",
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
                      hintText: "Escribe nueva ubicación",
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
                            "La ubicacion del usuario debe ser valida",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 14)),
                    TextSpan(
                        text: " en UrArtist ",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            "esto para que las bandas sepan de donde eres y asi tengan una mejor referencia",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8), fontSize: 14))
                  ]),
                ),
              ),
              
              
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
