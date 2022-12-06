import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:urartist/controller/services.dart';

import '../../../../utils/global_colors.dart';

import 'package:vibration/vibration.dart';

import '../../../controller/saveUserSharedPreferences.dart';

class EditTextFieldLastNameCommunity extends StatefulWidget {
  final Map<String,dynamic>? lastName;
  const EditTextFieldLastNameCommunity({super.key, this.lastName});

  @override
  State<EditTextFieldLastNameCommunity> createState() => _InputEditState();
}

class _InputEditState extends State<EditTextFieldLastNameCommunity> {
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
    _textEditingController.text = widget.lastName!["lastname"];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        appBar: AppBar(
          title: Text("Apellidos del usuario"),
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
                        "lastname": _textEditingController.text
                      }, 
                      widget.lastName!["id"] 
                      );
                    
                    if (response == StatusAccount.successfully) {
                       await SaveUserSharedPreferences().saveUserComunnity({
                        "id": widget.lastName!["id"],
                        "name":widget.lastName!["name"],
                        "lastname": _textEditingController.text,
                        "mail": widget.lastName!["mail"],
                        "photo_profile": widget.lastName!["photo_profile"],
                        "number_phone": widget.lastName!["number_phone"],
                        
                      });
                      if (mounted) {
                      Navigator.pop(context);
                    }
                    if (response == StatusAccount.badGateway) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Servicio no se encuentra")));
                      }
                    }
                    if (response == StatusAccount.serviceUnavailable) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Servicio no disponible")));
                      }
                    }
                  }
                  }
                },
                icon: const Icon(Icons.check)
                )
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
                  "Cambiar apellidos",
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
                    verificarLastName(value);
                  },
                  decoration: const InputDecoration(
                      hintText: "Cambiar apellidos ", border: InputBorder.none),
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
                                  "El apellido del usuario solo puede contener letras y debe ser mayor a 8 pero menor a 20",
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
                            "El apellido del usuario solo puede contener letras y debe ser mayor a 8 pero menor a 20",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w500),
                          ),
                        )
                  : const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Text(
                        "El apellido del usuario solo puede contener letras y debe ser mayor a 8 pero menor a 20",
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
                            "Tu puedes usar solo letras para la formacion de tu apellido ",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 14)),
                    TextSpan(
                        text: "a-z.",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: Text("Minimo debe contener 8 letras o maximo 20",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8), fontSize: 14)),
              )
            ],
          ),
        )
      ],
    );
  }

  void verificarLastName(String value) {
    final expAlfha = RegExp(r"^[a-zA-Z\s]*$");
    print(expAlfha.hasMatch(value));
    if (expAlfha.hasMatch(value) && value.length > 7 && value.length < 30) {
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
    // if (value.length < 8 || value.length > 20) {
    //   setState(() {
    //     usernameStatus = true;
    //     statusDisplay = true;
    //     tapValidWrite = false;
    //   });
    // } else if (value.length > 8) {
    //   setState(() {
    //     usernameStatus = false;
    //     tapValidWrite = false;
    //   });
    // }
  }
}
