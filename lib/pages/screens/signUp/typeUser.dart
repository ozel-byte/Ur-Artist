import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:urartist/pages/screens/signUp/infoArtist.dart';
import 'package:urartist/pages/screens/signUp/infoUser.dart';

import '../../../utils/global_colors.dart';

class TypeUser extends StatefulWidget {
  const TypeUser({super.key});

  @override
  State<TypeUser> createState() => _TypeUserState();
}

class _TypeUserState extends State<TypeUser> {
  bool switchArtista = false;
  bool switchUser = true;
  bool switchHuerfano = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title:  const Text("Tipo de usuario"),
      ),
      body:  Container(
      width: size.width,
      height: size.height * 0.35,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 2, spreadRadius: 2, color: Colors.grey.withOpacity(0.1))
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const  SizedBox(
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
                                 const Text(
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
                    style: const TextStyle(
                        color: GlobalColor.primary,
                        fontWeight: FontWeight.bold))
              ]),

              

            
            ),
            trailing: Switch(
              activeColor: Colors.white,
              activeTrackColor: GlobalColor.primary,
              inactiveTrackColor: Colors.grey,
              value: switchArtista,
              onChanged: (value) {
                switchArtista = value;
                switchHuerfano = false;
                switchUser = false;
                setState(() {});
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
                            return SizedBox(
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
                
                setState(() {});
                
              },
            ),
          ),
         const Divider(
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
               setState(() {
                switchArtista = false;
                switchUser = false;
                 switchHuerfano = value;
               });
                
              },
            ),
          )
        ],
      ),
    ),
      floatingActionButton: FloatingActionButton(onPressed:
      switchArtista || switchHuerfano || switchUser ? 
      (){
        if (switchArtista) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const InfoArtist();
        },));
        }
        if (switchHuerfano) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const InfoUser();
        },));
        }
        if (switchUser) {
       Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const InfoUser();
        },));
        }
      } : null,child: const Icon(Icons.arrow_forward),),
    );
  }
}