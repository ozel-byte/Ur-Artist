import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../utils/global_colors.dart';

import 'package:vibration/vibration.dart';

class EditTextFieldEmailArtist extends StatefulWidget {
  final Map<String,dynamic>? email;
   const EditTextFieldEmailArtist({super.key,this.email});

  @override
  State<EditTextFieldEmailArtist> createState() => _InputEditState();
}

class _InputEditState extends State<EditTextFieldEmailArtist> {
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
      _textEditingController.text = widget.email!["email"];

  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
  
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        appBar: AppBar(
          title:  Text("Email del usuario"),
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
                  "Cambiar correo electronico",
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
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    print(value);
                    verificarEmail(value);
                  },
                  decoration: const InputDecoration(
                      hintText: "Cambiar correo ",
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
                                  "Debe contener un correo valido",
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
                            "Debe contener un correo valido",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w500),
                          ),
                        )
                  : const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Text(
                        "Debe contener un correo valido",
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
                            "El correo electronico debe ser uno valido, ejemplo ",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 14)),
                    TextSpan(
                        text: "robbin@gmail.com robbin@hotmail.com etc",
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

  void verificarEmail(String value) {
    final regExpEmail = RegExp(r"^[a-z0-9](\.?[a-z0-9]){5,}@g(oogle)?mail\.com$");
    if (regExpEmail.hasMatch(value)) {
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
