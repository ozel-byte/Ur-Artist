import 'dart:convert';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:urartist/controller/validTextField.dart';
import 'package:urartist/controller/services.dart';
import 'package:urartist/pages/screens/signUp/viewLocation.dart';
import 'package:urartist/utils/global_colors.dart';
import 'package:file_picker/file_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TickerProviderStateMixin {
  bool switchArtista = false;
  bool switchUser = true;
  bool switchHuerfano = false;
  File? imgProfile;
  File? imgBackground;
  String? imgProfileBase64;
  String? imgBackgroundBase64;
  List<String> gen = [];
  double heightBottom = 350.0;
  String genDrow = "";
  bool loading = false;
  String latitude = "Selecione su ubicacón";
  String longitude = "";
  final PageController _pageController = PageController();
  Map<String, dynamic>? presskit;
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerLstName = TextEditingController();
  final TextEditingController _controllerUsernameContrasena = TextEditingController();
  final TextEditingController _controllerUsernameEmail = TextEditingController();
  final TextEditingController _controllerUsernameBio = TextEditingController();
  final TextEditingController _controllerUsernameUbicacion =
      TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerInstrumentos = TextEditingController();
  final TextEditingController _controllerEmailContact = TextEditingController();
  final TextEditingController _controllerformacion = TextEditingController();
  final TextEditingController _controllerGenero = TextEditingController();
  final TextEditingController _controllerEmailContactPresskit =
      TextEditingController();
  final TextEditingController _controllerLinkContenido =
      TextEditingController();
  final TextEditingController _controllerAllPersons = TextEditingController();

  int currentIndexPresskit = 0;
  bool savePresskit = false;
  bool statusMessageErrorUsername = false;
  bool statusMessageErrorPassword = false;
  bool statusMessageErrorEmail = false;
  bool statusMessageErrorBio = false;
  bool statusMessageErrorGps = false;
  bool statusMessageErrorNumber = false;
  bool statusMessageErrorLastName = false;
  bool statusMessageErrorInstrumet = false;
  bool statusMessageErrorEmailContact = false;

  String valueBio = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
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
          loading
              ? CircularProgressIndicator()
              : IconButton(
                  onPressed: () async {
                    
                    if (switchArtista) {
                      verifyArtist();
                    } else if (switchHuerfano) {
                    } else if (switchUser) {
                      verifyClient();
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
              height: switchHuerfano ? size.height * 1.2 : size.height * 0.9,
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
            subtitle: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Usuario en modo Artista ",
                    style: TextStyle(color: Colors.black.withOpacity(0.6))),
                TextSpan(
                    text: "Mas",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("object");
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 500,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: GlobalColor.primary),
                                      child: ZoomIn(
                                          child: const Icon(
                                        Icons.music_note_outlined,
                                        color: Colors.white,
                                        size: 40,
                                      ))),
                                  Text(
                                    "Modo Artista",
                                    style: TextStyle(
                                        color: GlobalColor.primary,
                                        fontSize: 18),
                                  ),
                                  const ListTile(
                                    leading: Icon(Icons.mediation_rounded),
                                    title: Text(
                                        "Un medio para promocionar a su banda"),
                                    subtitle: Text("Presskit"),
                                  ),
                                  Divider(),
                                  const ListTile(
                                    leading:
                                        Icon(Icons.video_camera_back_outlined),
                                    title: Text("Publicar Fotos/Videos"),
                                    subtitle: Text("Videos maximo de 10seg"),
                                  ),
                                  
                                ],
                              ),
                            );
                          },
                        );
                      },
                    style: TextStyle(
                        color: GlobalColor.primary,
                        fontWeight: FontWeight.bold))
              ]),

              // elevador pitch
              // poster
              // tablero
              // acta
              // plaenacion
              // presupuesto
              // riesgo
              // cronograma
              // product backblog
              // conjunto de historias

              // ejecution
              // carpegta por spring

              // cierre
              // comprobacion de gastos
              // encuesta (sin contestar resultados graficas)
              // conclusion sobre la solvatacion de la necesidad evaluacion de lo que se propuso y lo wue se obtuvo
              // reporte de riesgos
            ),
            trailing: Switch(
              activeColor: Colors.white,
              activeTrackColor: GlobalColor.primary,
              inactiveTrackColor: Colors.grey,
              value: switchArtista,
              onChanged: (value) {
                switchArtista = value;
                latitude = "";
                switchHuerfano = false;
                switchUser = false;
                setState(() {});
                trashTextEdingController();
              },
            ),
          ),
          const Divider(
            indent: 20,
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(Icons.person_pin_circle_outlined),
            title: const Text("Usuario Normal"),
            subtitle: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Comunidad ",
                    style: TextStyle(color: Colors.black.withOpacity(0.6))),
                TextSpan(
                    text: "Más",
                    style: const TextStyle(
                        color: GlobalColor.primary,
                        fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 300,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: GlobalColor.primary),
                                      child: ZoomIn(
                                          child: const Icon(
                                        Icons.person_pin_circle_sharp,
                                        color: Colors.white,
                                        size: 40,
                                      ))),
                                  const Text(
                                    "Modo Comunidad",
                                    style: TextStyle(
                                        color: GlobalColor.primary,
                                        fontSize: 18),
                                  ),
                                  const ListTile(
                                    leading: Icon(Icons.person_search_outlined),
                                    title: Text(
                                        "Encontrar variedad de grupos musicales para amenizar tu evento"),
                                    subtitle:
                                        Text("Artista dentro de tu localidad"),
                                  ),
                                  Divider(),
                                  const ListTile(
                                    leading:
                                        Icon(Icons.folder_special_outlined),
                                    title:
                                        Text("Añadir a tus artistas favoritos"),
                                    subtitle: Text(
                                        "Ver en todo momento lo que comparten sus artistas"),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      })
              ]),
            ),
            trailing: Switch(
              activeColor: Colors.white,
              activeTrackColor: GlobalColor.primary,
              inactiveTrackColor: Colors.grey,
              value: switchUser,
              onChanged: (value) {
                switchUser = value;
                switchArtista = false;
                switchHuerfano = false;
                imgProfile = null;
                setState(() {});
                trashTextEdingController();
              },
            ),
          ),
          Divider(
            indent: 20,
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Huerfano"),
            subtitle: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Artista huerfano ",
                  style: TextStyle(color: Colors.black.withOpacity(0.6))),
              TextSpan(
                  text: "Más",
                  style: const TextStyle(
                      color: GlobalColor.primary, fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: GlobalColor.primary),
                                    child: ZoomIn(
                                        child: const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 40,
                                    ))),
                                const Text(
                                  "Modo Huerfano",
                                  style: TextStyle(
                                      color: GlobalColor.primary, fontSize: 18),
                                ),
                                const ListTile(
                                  leading: Icon(Icons.person_search_outlined),
                                  title: Text(
                                      "Dar a conocer tu talento para que un grupo musical te contacte"),
                                  subtitle: Text("Unirte a una banda"),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    })
            ])),
            trailing: Switch(
              activeColor: Colors.white,
              activeTrackColor: GlobalColor.primary,
              inactiveTrackColor: Colors.grey,
              value: switchHuerfano,
              onChanged: (value) {
                switchHuerfano = value;
                latitude = "Selecion su ubicacion";
                switchArtista = false;
                switchUser = false;
                imgProfile = null;
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
          ListTile(
            onTap: () {},
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
                setState(() {});
                List<int> imgbytes = imgProfile!.readAsBytesSync();
                imgProfileBase64 = base64Encode(imgbytes);
              } else {
                // User canceled the picker
              }
            },
            child: ListTile(
              leading: imgProfile != null
                  ? CircleAvatar(
                      radius: 30,
                      backgroundImage: FileImage(imgProfile!),
                    )
                  : const CircleAvatar(
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
                setState(() {});
              } else {
                // User canceled the picker
              }
            },
            child: ListTile(
              leading: Container(
                  width: 70,
                  height: 50,
                  decoration: imgBackground == null
                      ? BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                        )
                      : BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(imgBackground!)))),
              title: Text("Cambiar Imagen de fondo"),
              subtitle: Text("Precione para cambiar su portada"),
            ),
          ),
          const Divider(
            indent: 30,
          ),
          GestureDetector(
            onTap: () {
              heightBottom = 350;
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  enableDrag: true,
                  builder: (context) {
                    return BottomSheet(
                        onClosing: () {
                          print("se cerro");
                        },
                        animationController:
                            BottomSheet.createAnimationController(this),
                        builder: (context) {
                          currentIndexPresskit = 0;

                          return StatefulBuilder(builder: (context, setState) {
                            return Container(
                                height: heightBottom,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 300,
                                      child: PageView(
                                        controller: _pageController,
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
                                                height: 300,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                           const Text(
                                                                "Año de formacion"),
                                                           const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                                width:
                                                                    size.width *
                                                                        0.4,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey
                                                                            .withOpacity(
                                                                                0.5))),
                                                                child:
                                                                    TextField(
                                                                  controller:
                                                                      _controllerformacion,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  decoration: const InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      contentPadding:
                                                                          EdgeInsets.all(
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
                                                           const Text(
                                                                "Total de Integrantes"),
                                                           const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                                width:
                                                                    size.width *
                                                                        0.4,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey
                                                                            .withOpacity(
                                                                                0.5))),
                                                                child:
                                                                    TextField(
                                                                  controller:
                                                                      _controllerAllPersons,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  decoration: const InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      contentPadding:
                                                                          EdgeInsets.all(
                                                                              10),
                                                                      hintText:
                                                                          "Ingrese el total de los integrantes"),
                                                                ))
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                       const Text("Correo Contacto"),
                                                       const SizedBox(
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
                                                            child: TextField(
                                                              controller:
                                                                  _controllerEmailContactPresskit,
                                                              onTap: () {
                                                                print("hola");
                                                                setState(
                                                                  () {
                                                                    heightBottom =
                                                                        size.height *
                                                                            0.8;
                                                                  },
                                                                );
                                                              },
                                                              decoration: const InputDecoration(
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
                                                   const Text("Genero"),
                                                   const SizedBox(
                                                      height: 10,
                                                    ),
                                                    FutureBuilder(
                                                      future: ApiServices().getGen(),
                                                      builder: (context, AsyncSnapshot<List<String>> snapshot) {
                                                        if (snapshot.hasData) {
                                                          
                                                          return Container(
                                                        width: size.width * 0.8,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.5))),
                                                        child: DropdownButton(
                                                          isExpanded: true,
                                                          itemHeight: null,
                                                          value: genDrow,
                                                          items: snapshot.data!.map<
                                                              DropdownMenuItem<
                                                                  String>>((e) {
                                                            return DropdownMenuItem(
                                                              value: e,
                                                              child: Text(e),
                                                            );
                                                          }).toList(),
                                                          onChanged: (value) {
                                                            setState(
                                                              () {
                                                            genDrow = value!;

                                                              },
                                                            );
                                                          },
                                                        ));
                                                        }else{
                                                          return const CircularProgressIndicator();
                                                        }
                                                      },
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
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
                                                        child: TextField(
                                                          maxLines: 5,
                                                          controller:
                                                              _controllerLinkContenido,
                                                          decoration: const InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(10),
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
                                        if (currentIndexPresskit == 0) {
                                          _pageController.jumpToPage(1);
                                        } else if (currentIndexPresskit == 1) {
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
          ListTile(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();

              if (result != null) {
                imgProfile = File(result.files.single.path!);
                setState(() {});
              } else {
                // User canceled the picker
              }
            },
            leading: imgProfile == null
                ? const CircleAvatar(
                    radius: 30,
                    backgroundColor: GlobalColor.primary,
                  )
                : CircleAvatar(
                    radius: 30,
                    backgroundImage: FileImage(imgProfile!),
                  ),
            title: const Text("Cambiar Imagen de perfil"),
            subtitle: const Text("Precione para cambiar su foto de perfil"),
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
              width: size.width * 0.88,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerUsername,
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
                        ? "Maximo 10 caracteres"
                        : "",
                    counterStyle: TextStyle(
                        color: statusMessageErrorUsername
                            ? Colors.red
                            : Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: statusMessageErrorUsername
                                ? Colors.red
                                : Color(0xffD9D9D9))),
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
            const Text("Contraseña"),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.88,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerUsernameContrasena,
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
                    counterStyle: TextStyle(
                        color: statusMessageErrorPassword
                            ? Colors.red
                            : Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: statusMessageErrorPassword
                                ? Colors.red
                                : Color(0xffD9D9D9))),
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
            const Text("Apellidos"),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.88,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerLstName,
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
                keyboardType: TextInputType.emailAddress,
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
                    counterStyle: TextStyle(
                        color:
                            statusMessageErrorEmail ? Colors.red : Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: statusMessageErrorEmail
                                ? Colors.red
                                : Color(0xffD9D9D9))),
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
            const Text("Telefono"),
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
                    counterText:
                        statusMessageErrorNumber ? "Numero invalido" : "",
                    counterStyle: TextStyle(
                        color: statusMessageErrorNumber
                            ? Colors.red
                            : Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: statusMessageErrorNumber
                                ? Colors.red
                                : Color(0xffD9D9D9))),
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
                    helperText:
                        valueBio.length > 150 ? "Maximo 150 caracteres" : "",
                    helperStyle: TextStyle(
                        color:
                            valueBio.length >= 150 ? Colors.red : Colors.grey),
                    counterStyle: TextStyle(
                        color:
                            valueBio.length >= 150 ? Colors.red : Colors.grey),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba su biografia"),
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
                  latitude =
                      position["latitude"] + "  -  " + position["longitude"];
                });
              },
              child: Container(
                width: size.width * 0.88,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                    color: Color(0xffF7F7F7)),
                child: Text(latitude),
              ),
            )
          ],
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
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nombre de usuario"),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.88,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerUsername,
                onChanged: (value) {
                  if (ValidTextField().validUsername(value)) {
                    setState(() {
                      statusMessageErrorUsername = true;
                    });
                  } else {
                    statusMessageErrorUsername = false;
                  }
                },
                decoration: InputDecoration(
                    counterText: statusMessageErrorUsername
                        ? "Maximo 10 caracteres"
                        : "",
                    counterStyle: TextStyle(
                        color: statusMessageErrorUsername
                            ? Colors.red
                            : Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: statusMessageErrorUsername
                                ? Colors.red
                                : Color(0xffD9D9D9))),
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
            const Text("Correo"),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.88,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerUsernameEmail,
                keyboardType: TextInputType.emailAddress,
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
                    counterStyle: TextStyle(
                        color:
                            statusMessageErrorEmail ? Colors.red : Colors.grey),
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
                        ? "maximo 10 caracteres"
                        : "",
                    counterStyle: TextStyle(
                        color: statusMessageErrorPassword
                            ? Colors.red
                            : Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: statusMessageErrorPassword
                                ? Colors.red
                                : Color(0xffD9D9D9))),
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
                    counterText: "${valueBio.length}/50",
                    helperText:
                        valueBio.length > 49 ? "Maximo 20 caracteres" : "",
                    helperStyle: TextStyle(
                        color:
                            valueBio.length >= 50 ? Colors.red : Colors.grey),
                    counterStyle: TextStyle(
                        color:
                            valueBio.length >= 50 ? Colors.red : Colors.grey),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD9D9D9))),
                    hintText: "Escriba su biografia"),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Instrumento"),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.88,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerInstrumentos,
                onChanged: (value) {
                  if (ValidTextField().validInstrument(value)) {
                    setState(() {
                      statusMessageErrorInstrumet = true;
                    });
                  } else {
                    setState(() {
                      statusMessageErrorInstrumet = false;
                    });
                  }
                },
                decoration:  InputDecoration(
                  counterText: statusMessageErrorInstrumet ? "Maximo 10 caracteres" : "",
                  counterStyle: TextStyle(color: statusMessageErrorInstrumet ? Colors.red : Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: statusMessageErrorInstrumet ?Colors.red : Color(0xffD9D9D9))),
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
            const Text("Telefono"),
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
                  }else{
                    setState(() {
                      statusMessageErrorNumber = false;
                    });
                  }
                },
                decoration:  InputDecoration(
                  counterText: statusMessageErrorNumber ? "Numero invalido": "",
                  counterStyle: TextStyle(color: statusMessageErrorNumber ? Colors.red  : Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: statusMessageErrorNumber ? Colors.red: Color(0xffD9D9D9))),
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
           const Text("Correo de contacto"),
           const SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * 0.88,
              decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
              child: TextField(
                controller: _controllerEmailContact,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  if (ValidTextField().validEmail(value)) {
                    setState(() {
                      statusMessageErrorEmailContact = true;
                    });
                  }else{
                    setState(() {
                      statusMessageErrorEmailContact = false;
                    });
                  }
                },
                decoration:  InputDecoration(
                  counterText: statusMessageErrorEmailContact ? "Correo invalido": "",
                  counterStyle: TextStyle(color: statusMessageErrorEmailContact ? Colors.red : Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: statusMessageErrorEmailContact ?Colors.red : Color(0xffD9D9D9))),
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
                if (position !=null ) {
                setState(() {
                  latitude =
                      position["latitude"] + "  -  " + position["longitude"];
                });
                }else{
                  if(mounted){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Ubicacion no detecta")));
                  }
                }
              },
              child: Container(
                width: size.width * 0.88,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                    color: Color(0xffF7F7F7)),
                child: Text(latitude),
              ),
            )
          ],
        ),
      ],
    );
  }

  void verifyArtist() async {
    if (_controllerUsername.text.isNotEmpty &&
        _controllerUsernameBio.text.isNotEmpty &&
        _controllerUsernameContrasena.text.isNotEmpty &&
        _controllerUsernameEmail.text.isNotEmpty &&
        _controllerformacion.text.isNotEmpty &&
        _controllerEmailContactPresskit.text.isNotEmpty &&
        _controllerPhone.text.isNotEmpty &&
        _controllerLinkContenido.text.isNotEmpty &&
        _controllerAllPersons.text.isNotEmpty &&
        genDrow.isNotEmpty &&
        imgProfile != null && latitude.isNotEmpty
        // && presskit != null && imgProfile != null
        ) {
          setState(() {
                      loading = true;
                    });
      ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text("Creando cuenta...")));
         
      Map<String, dynamic> artist = {
        "name": _controllerUsername.text,
        "email": _controllerUsernameEmail.text,
        "password": _controllerUsernameContrasena.text,
        "name_artistic": _controllerUsername.text,
        "photo_profile": imgProfile!.path,
        "brief_description": _controllerUsernameBio.text,
        "location": latitude,
        "background": imgBackground!.path
      };
      Map<String, dynamic> presskit = {
        "anio_formacion": _controllerformacion.text,
        "genero": genDrow,
        "correo_contecto": _controllerEmailContactPresskit.text,
        "telefono": _controllerPhone.text,
        "link_a_contenido": _controllerLinkContenido.text,
        "total_integrantes": _controllerAllPersons.text
      };
      final response = await ApiServices().createArtist(artist, presskit);

      if (response == StatusAccount.successfully) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Usuario se creo correctamente")));
          Navigator.pushReplacementNamed(context, "home-page-artist");
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Usuario no se creo correctamente")));
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Rellenar todos los campos")));
    }
  }

  void verifyClient() async {
      ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text("Creando cuenta...")));
    if (_controllerUsername.text.isNotEmpty &&
        _controllerLstName.text.isNotEmpty &&
        _controllerUsernameEmail.text.isNotEmpty &&
        _controllerUsernameContrasena.text.isNotEmpty &&
        imgProfile != null &&
        _controllerPhone.text.isNotEmpty) {
      Map<String, dynamic> user = {
        "name": _controllerUsername.text,
        "lastname": _controllerLstName.text,
        "mail": _controllerUsernameEmail.text,
        "password": _controllerUsernameContrasena.text,
        "photo_profile":
            imgProfile!.path,
        "number_phone": _controllerPhone.text
      };
      final response = await ApiServices().createComunidad(user);

      if (response == StatusAccount.successfully) {
        if (mounted) {
             ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Usuario creado")));
          Navigator.pushReplacementNamed(context, "home-page-community");
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text("No se pudo crear intentelo de nuevo")));
        }
      }
    }
  }
}
