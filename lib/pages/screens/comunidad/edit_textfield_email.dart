import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:urartist/controller/services.dart';

import '../../../../utils/global_colors.dart';

import 'package:vibration/vibration.dart';

import '../../../controller/saveUserSharedPreferences.dart';

class EditTextFieldEmailCommunity extends StatefulWidget {
  final  Map<String,dynamic>? email;
   const EditTextFieldEmailCommunity({super.key,this.email});

  @override
  State<EditTextFieldEmailCommunity> createState() => _InputEditState();
}

class _InputEditState extends State<EditTextFieldEmailCommunity> {
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
      _textEditingController.text = widget.email!["mail"];

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
                      Vibration.vibrate(amplitude: 128);
                    setState(() {
                      vibration = true;
                      tapValidWrite = true;
                    });
                  }else{
                    final response = await ApiServices().updateTextField(
                      {
                        "mail" : _textEditingController.text
                      }, 
                      widget.email!["id"]);

                      if (response == StatusAccount.successfully) {
                         await SaveUserSharedPreferences().saveUserComunnity({
                        "id": widget.email!["id"],
                        "name": widget.email!["name"],
                        "lastname": widget.email!["lastname"],
                        "mail": _textEditingController.text,
                        "photo_profile": widget.email!["photo_profile"],
                        "number_phone": widget.email!["number_phone"],
                        
                      });
                      if (mounted) {
                      Navigator.pop(context);
                      }
                      }
                       if (response == StatusAccount.badGateway) {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No se encuentra la ruta")));
                        }
                      }
                       if (response == StatusAccount.serviceUnavailable) {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Servicio no disponible")));
                        }
                      }
                       if (response == StatusAccount.error) {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error")));
                        }
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
