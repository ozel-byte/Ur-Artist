import 'dart:convert';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:urartist/utils/global_colors.dart';
import 'package:file_picker/file_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool switchArtista = false;
  bool switchUser = true;
  bool switchHuerfano = false;
  File? imgProfile;
  File? imgBackground;
  String? imgProfileBase64;
  String? imgBackgroundBase64;
  TextEditingController _controllerUsername = TextEditingController();
  TextEditingController _controllerLstName = TextEditingController();
  TextEditingController _controllerUsernameContrasena = TextEditingController();
  TextEditingController _controllerUsernameEmail = TextEditingController();
  TextEditingController _controllerUsernameBio = TextEditingController();
  TextEditingController _controllerUsernameUbicacion = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerInstrumentos = TextEditingController();
  TextEditingController _controllerEmailContact = TextEditingController();
  TextEditingController _controllerformacion = TextEditingController();
  TextEditingController _controllerGenero = TextEditingController();
  TextEditingController _controllerEmailContactPresskit =
      TextEditingController();
  TextEditingController _controllerLinkContenido = TextEditingController();
  TextEditingController _controllerAllPersons = TextEditingController();

  int currentIndexPresskit = 0;
  bool savePresskit = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        title: const Text(
          "Añadir Usuario",
          style: TextStyle(color: Color(0xff3F494F)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (_controllerEmailContact.text.isNotEmpty &&
                    _controllerInstrumentos.text.isNotEmpty &&
                    _controllerLstName.text.isNotEmpty &&
                    _controllerPhone.text.isNotEmpty &&
                    _controllerUsername.text.isNotEmpty &&
                    _controllerUsernameBio.text.isNotEmpty &&
                    _controllerUsernameContrasena.text.isNotEmpty &&
                    _controllerUsernameEmail.text.isNotEmpty &&
                    _controllerUsernameUbicacion.text.isNotEmpty) {
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Rellenar todos los campos")));
                }
              },
              icon: const Icon(
                Icons.check,
                color: Colors.grey,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            typeUser(size),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              height: switchHuerfano ? size.height * 1 : size.height * 0.8,
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: switchUser
                      ? infoUser(size)
                      : switchArtista
                          ? infoArtista(size)
                          : switchHuerfano
                              ? infoHuerfano(size)
                              : Container(
                                  child: const Center(
                                      child:
                                          Text("Selecione un tipo de usuario")),
                                )),
            ),
            const SizedBox(
              height: 20,
            ),
            switchUser
                ? fotoUser(size)
                : switchArtista
                    ? fotoArtist(size)
                    : switchHuerfano
                        ? fotoHuerfano(size)
                        : Container(
                            child: Text(""),
                          )
          ],
        ),
      ),
    );
  }

  trashTextEdingController() {
    _controllerEmailContact.text = "";
    _controllerInstrumentos.text = "";
    _controllerLstName.text = "";
    _controllerPhone.text = "";
    _controllerUsername.text = "";
    _controllerUsernameBio.text = "";
    _controllerUsernameContrasena.text = "";
    _controllerUsernameEmail.text = "";
    _controllerUsernameUbicacion.text = "";
  }

  Container typeUser(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.3,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 2, spreadRadius: 2, color: Colors.grey.withOpacity(0.1))
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "Seleciona el tipo de usuario",
              style: TextStyle(
                  color: GlobalColor.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.music_note),
            title: const Text("Artista"),
            trailing: Switch(
              value: switchArtista,
              onChanged: (value) {
                switchArtista = value;
                switchHuerfano = false;
                switchUser = false;
                setState(() {});
                trashTextEdingController();
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_pin_circle_outlined),
            title: const Text("Usuario Normal"),
            trailing: Switch(
              value: switchUser,
              onChanged: (value) {
                switchUser = value;
                switchArtista = false;
                switchHuerfano = false;
                setState(() {});
                trashTextEdingController();
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Huerfano"),
            trailing: Switch(
              value: switchHuerfano,
              onChanged: (value) {
                switchHuerfano = value;
                switchArtista = false;
                switchUser = false;
                setState(() {});
                trashTextEdingController();
              },
            ),
          )
        ],
      ),
    );
  }

  Container fotoHuerfano(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.4,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 2, spreadRadius: 2, color: Colors.grey.withOpacity(0.1))
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "Foto Perfil",
              style: TextStyle(
                  color: GlobalColor.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: GlobalColor.primary,
            ),
            title: Text("Cambiar Imagen de perfil"),
            subtitle: Text("Precione para cambiar su foto de perfil"),
          ),
          Divider(),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 5),
            child: Text(
              "Foto Portada",
              style: TextStyle(
                  color: GlobalColor.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Container(
              width: 70,
              height: 50,
              color: Colors.grey.withOpacity(0.2),
            ),
            title: Text("Cambiar Imagen de fondo"),
            subtitle: Text("Precione para cambiar su portada"),
          ),
        ],
      ),
    );
  }

  Container fotoArtist(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.42,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 2, spreadRadius: 2, color: Colors.grey.withOpacity(0.1))
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "Foto Perfil",
              style: TextStyle(
                  color: GlobalColor.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();

              if (result != null) {
                imgProfile = File(result.files.single.path!);
                List<int> imgbytes = imgProfile!.readAsBytesSync();
                imgProfileBase64 = base64Encode(imgbytes);
              } else {
                // User canceled the picker
              }
            },
            child: const ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: GlobalColor.primary,
              ),
              title: Text("Cambiar Imagen de perfil"),
              subtitle: Text("Precione para cambiar su foto de perfil"),
            ),
          ),
          Divider(
            indent: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 5),
            child: Text(
              "Foto Portada",
              style: TextStyle(
                  color: GlobalColor.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();

              if (result != null) {
                imgBackground = File(result.files.single.path!);
                List<int> imgbytes = imgBackground!.readAsBytesSync();
                imgBackgroundBase64 = base64Encode(imgbytes);
              } else {
                // User canceled the picker
              }
            },
            child: ListTile(
              leading: Container(
                width: 70,
                height: 50,
                color: Colors.grey.withOpacity(0.2),
              ),
              title: Text("Cambiar Imagen de fondo"),
              subtitle: Text("Precione para cambiar su portada"),
            ),
          ),
          const Divider(
            indent: 30,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BottomSheet(
                        onClosing: () {},
                        builder: (context) {
                          currentIndexPresskit = 0;
                          return StatefulBuilder(builder: (context, setState) {
                            return Container(
                                height: 500,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 380,
                                      child: PageView(
                                        onPageChanged: (value) {
                                          setState(() {
                                            currentIndexPresskit = value;
                                            print("object");
                                            print(value);
                                          });
                                        },
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                width: size.width,
                                                height: 380,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            "Año de formacion"),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                            width: size.width *
                                                                0.8,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.5))),
                                                            child:
                                                                const TextField(
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10),
                                                                  hintText:
                                                                      "Ingrese su año de formacion"),
                                                            ))
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Correo Contacto"),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                            width: size.width *
                                                                0.8,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.5))),
                                                            child:
                                                                const TextField(
                                                              decoration: InputDecoration(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10),
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "Ingrese su correo de contacto"),
                                                            ))
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            "Total de Integrantes"),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                            width: size.width *
                                                                0.8,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.5))),
                                                            child:
                                                                const TextField(
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10),
                                                                  hintText:
                                                                      "Ingrese el total de los integrantes"),
                                                            ))
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 300,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text("Genero"),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                        width: size.width * 0.8,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.5))),
                                                        child: const TextField(
                                                          maxLines: 5,
                                                          decoration:
                                                              InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "Ingrese sus generos"),
                                                        ))
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        "Link a su contenido en plataformas externas"),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                        width: size.width * 0.8,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.5))),
                                                        child: const TextField(
                                                          maxLines: 5,
                                                          decoration:
                                                              InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "Ingrese los links"),
                                                        ))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (currentIndexPresskit == 1) {
                                          savePresskitFunc();
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Container(
                                        width: size.width * 0.8,
                                        height: size.height * 0.06,
                                        color: GlobalColor.primary,
                                        child: Center(
                                            child: Text(
                                          currentIndexPresskit == 0
                                              ? "Siguiente"
                                              : "Guardar",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    )
                                  ],
                                ));
                          });
                        });
                  });
            },
            child: ListTile(
              leading: const Icon(Icons.present_to_all_sharp),
              title: Text("Agregar presskit"),
              trailing: savePresskit
                  ? ZoomIn(
                    child: const Icon(
                        Icons.check_circle,
                        color: GlobalColor.primary,
                      ),
                  )
                  : const Text(""),
            ),
          )
        ],
      ),
    );
  }

  savePresskitFunc() {
    setState(
      () {
        savePresskit = true;
      },
    );
  }

  Container fotoUser(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.2,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 2, spreadRadius: 2, color: Colors.grey.withOpacity(0.1))
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "Foto Perfil",
              style: TextStyle(
                  color: GlobalColor.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: GlobalColor.primary,
            ),
            title: Text("Cambiar Imagen de perfil"),
            subtitle: Text("Precione para cambiar su foto de perfil"),
          )
        ],
      ),
    );
  }

  Column infoUser(Size size) {
    return Column(
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nombre"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerUsername,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba su nombre"),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Contraseña"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerUsernameContrasena,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba su contraseña"),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Apellidos"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerLstName,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba su apellido"),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Correo"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerUsernameEmail,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba su correo"),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Telefono"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerPhone,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba su telefono"),
              ),
            )
          ],
        ),
      ],
    );
  }

  Column infoArtista(Size size) {
    return Column(
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nombre Artistico"),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerUsername,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba su nombre"),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Contraseña"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerUsernameContrasena,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba su contraseña"),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Correo"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerUsernameEmail,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba su correo"),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bio"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                maxLines: 5,
                controller: _controllerUsernameBio,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba su BioGrfia"),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ubicacion"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerUsernameUbicacion,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Selecione su ubicacion"),
              ),
            )
          ],
        ),
      ],
    );
  }

  Column infoHuerfano(Size size) {
    return Column(
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
        SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nombre de usuario"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerUsername,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba su nombre de usuario"),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Correo"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerUsernameEmail,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba su correo"),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Contraseña"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerUsernameContrasena,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba su contraseña"),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Biografia"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerUsernameBio,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba su Biografia"),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Instrumento"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerInstrumentos,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba sus Intrusmentos"),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Telefono"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerPhone,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba su Telefono"),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Correo de contacto"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerEmailContact,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba su correo de contacto"),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Ubicaion"),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.8,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerUsernameUbicacion,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba su Ubicacion"),
              ),
            )
          ],
        ),
      ],
    );
  }
}
