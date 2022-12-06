import 'package:flutter/material.dart';
import 'package:urartist/pages/screens/signUp/recuperar_contrasena.dart';

import '../../../controller/services.dart';

class Presskit extends StatefulWidget {
  final Map<String, dynamic>? infoUser;
  final Map<String, dynamic>? photos;
  const Presskit({super.key, this.infoUser, this.photos});

  @override
  State<Presskit> createState() => _PresskitState();
}

class _PresskitState extends State<Presskit> {
  String genDrow = "Cumbia";
  final TextEditingController _controlleranio = TextEditingController();
  final TextEditingController _controllerNumberTeam = TextEditingController();
  final TextEditingController _controlleremail = TextEditingController();
  final TextEditingController _controllerLink = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Presskit"),
        elevation: 0.0,
      ),
      body: Container(
        width: size.width,
        height: size.height * 0.6,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Año"),
                        Container(
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                border: Border.all(color: Colors.grey)),
                            child: TextField(
                              controller: _controlleranio,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            )),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Numero de integrantes"),
                        Container(
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                border: Border.all(color: Colors.grey)),
                            child: TextField(
                              controller: _controllerNumberTeam,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            )),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Correo de contacto"),
                    Container(
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            border: Border.all(color: Colors.grey)),
                        child: TextField(
                          controller: _controlleremail,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      color: Colors.grey.withOpacity(0.5))),
                              child: DropdownButton(
                                isExpanded: true,
                                itemHeight: null,
                                value: genDrow,
                                items: snapshot.data!
                                    .map<DropdownMenuItem<String>>((e) {
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
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Link de redes sociales"),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            border: Border.all(color: Colors.grey)),
                        child:  TextField(
                          maxLines: 4,
                          controller: _controllerLink,
                          decoration: const InputDecoration(border: InputBorder.none),
                        )),
                  ],
                ),
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_controlleremail.text.isNotEmpty && _controllerLink.text.isNotEmpty && _controllerNumberTeam.text.isNotEmpty && _controlleranio.text.isNotEmpty) {
            
            
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RecoveryPassword(
                user: {
              "email": widget.infoUser!["email"],
              "password": widget.infoUser!["password"],
              "name_artistic": widget.infoUser!["name"],
              "brief_description": widget.infoUser!["bio"],
              "location": widget.infoUser!["position"],
              "photo_profile": widget.photos!["photo-profile"],
              "background": widget.photos!["photo-background"]
            }, preskkit: {
              "anio_formacion": _controlleranio.text,
              "genero": genDrow,
              "correo_contecto" : _controlleremail.text,
              "telefono": widget.infoUser!["phone"],
              "link_a_contenido": _controllerLink.text,
              "total_integrantes" : _controllerNumberTeam.text
            },
              );
            },));
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}


