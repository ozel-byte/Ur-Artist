import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../utils/global_colors.dart';

import 'package:vibration/vibration.dart';

class EditTextFieldPhoneArtist extends StatefulWidget {
  final Map<String,dynamic>? phone;
   const EditTextFieldPhoneArtist({super.key,this.phone});

  @override
  State<EditTextFieldPhoneArtist> createState() => _InputEditState();
}

class _InputEditState extends State<EditTextFieldPhoneArtist> {
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
      _textEditingController.text = widget.phone!["dd"];

  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
  
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        appBar: AppBar(
          title: const  Text("Telefono del usuario"),
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
                  "Cambiar numero telefonico",
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
                  // keyboardType: TextInputType.number,
                  onChanged: (value) {
                    print(value);
                    verificarPhone(value);
                  },
                  decoration: const InputDecoration(
                      hintText: "Cambiar numero telefono ",
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
                                  "El numero telefonico solo puede contener numeros y debe ser igual a 12 digitos",
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
                            "El numero telefonico solo puede contener numeros y debe ser igual a 12 digitos",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w500),
                          ),
                        )
                  : const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Text(
                        "El numero telefonico solo puede contener numeros y debe ser igual a 12 digitos",
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
                            "Para la formacion de tu numero telefonico solo debe contener numeros y tiene que ser igual a ",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 14)),
                    TextSpan(
                        text: "12 digitos",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ]),
                ),
              ),
              
            ],
          ),
        )
      ],
    );
  }

  void verificarPhone(String value) {
    final regExpNumber = RegExp(r"^[0-9]*$");
    print(regExpNumber.hasMatch(value));
    if (regExpNumber.hasMatch(value) && value.length == 10) {
      setState(() {
        usernameStatus = false;
        tapValidWrite = false;
      });
    } else {
      setState(() {
        usernameStatus = true;
        statusDisplay = true;
        tapValidWrite = false;
      });
    }
  }
}
