import 'package:flutter/material.dart';
import 'package:urartist/controller/saveUserSharedPreferences.dart';

import '../../../controller/services.dart';

class RecoveryPassword extends StatefulWidget {
  final Map<String, dynamic>? user;

  final Map<String, dynamic>? preskkit;
  const RecoveryPassword({super.key, this.user, this.preskkit});

  @override
  State<RecoveryPassword> createState() => _RecoveryPasswordState();
}

class _RecoveryPasswordState extends State<RecoveryPassword> {
  TextEditingController _controllerQuestion1 = TextEditingController();
  TextEditingController _controllerQuestion2 = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Preguntas para la contraseña"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Ciudad en la que naciste"),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width * 0.88,
                  decoration: const BoxDecoration(
                    color: Color(0xffF7F7F7),
                  ),
                  child: TextField(
                    controller: _controllerQuestion1,
                    maxLength: 20,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffD9D9D9))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffD9D9D9))),
                        hintText: "Escriba la ciudad"),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Nombre de tu escuela primaria"),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width * 0.88,
                  decoration: const BoxDecoration(
                    color: Color(0xffF7F7F7),
                  ),
                  child: TextField(
                    controller: _controllerQuestion2,
                    maxLength: 20,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffD9D9D9))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffD9D9D9))),
                        hintText: "Escriba el nombre de la escuela"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_controllerQuestion1.text.isNotEmpty &&
              _controllerQuestion2.text.isNotEmpty) {
            setState(() {
              loading = true;
            });
            final response = await ApiServices().createArtist({
              "email": widget.user!["email"],
              "password": widget.user!["password"],
              "name_artistic": widget.user!["name_artistic"],
              "brief_description": widget.user!["brief_description"],
              "location": widget.user!["location"],
              "photo_profile": widget.user!["photo_profile"],
              "background": widget.user!["background"],
              "question_1": _controllerQuestion1.text,
              "question_2": _controllerQuestion2.text
            }, {
              "anio_formacion": widget.preskkit!["anio_formacion"],
              "genero": widget.preskkit!["genero"],
              "correo_contecto": widget.preskkit!["correo_contecto"],
              "telefono": widget.preskkit!["telefono"],
              "link_a_contenido": widget.preskkit!["link_a_contenido"],
              "total_integrantes": widget.preskkit!["total_integrantes"],
            });

            if (response == StatusAccount.successfully) {
              if (mounted) {
                setState(() {
                  loading = false;
                });
                SaveUserSharedPreferences().saveSignIn("home-page-artist");
                Navigator.pushNamed(context, "home-page-artist");
              }
            } else {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Error al crear la cuenta")));
              }
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Faltan campos por rellenar")));
          }
        },
        child: loading ? const CircularProgressIndicator(color: Colors.white,) : const Icon(Icons.check),
      ),
    );
  }
}
