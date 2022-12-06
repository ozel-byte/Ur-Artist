import 'package:flutter/material.dart';
import 'package:urartist/pages/screens/huerfano/edit_textField_bio.dart';
import 'package:urartist/pages/screens/huerfano/edit_textField_email.dart';
import 'package:urartist/pages/screens/huerfano/edit_textField_email_contact.dart';
import 'package:urartist/pages/screens/huerfano/edit_textField_instrumento.dart';
import 'package:urartist/pages/screens/huerfano/edit_textField_phone.dart';
import 'package:urartist/pages/screens/huerfano/edit_textField_ubi.dart';
import 'package:urartist/utils/global_colors.dart';

class EditInfoListHuerfano extends StatefulWidget {
  const EditInfoListHuerfano({
    super.key,
  });

  @override
  State<EditInfoListHuerfano> createState() => _EditInfoListHuerfanoState();
}

class _EditInfoListHuerfanoState extends State<EditInfoListHuerfano> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: GlobalColor.primary,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(args["img"]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(args["nombre"]),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              height: size.height * 0.62,
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
                    padding: EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      "Cuenta",
                      style: TextStyle(
                          color: GlobalColor.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "input-edit",
                        arguments: args),
                    child: ListTile(
                      title: Text(args["nombre"]),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Nombre Usuario"),
                          Divider(
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return EditTextFieldInstrumentHuerfano(instrument: "Teclado",);
                      },));
                    },
                    title: Text("Teclado"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Instrumento"),
                        Divider(
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return EditTextFieldEmailHuerfano(email: args["email"],);
                      },));
                    },
                    title: Text(args["email"]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("correo"),
                        Divider(
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return EditTextFieldEmailCotactHuerfano(email: args["email"],);
                      },));
                    },
                    title: Text(args["email"]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("correo de contacto"),
                        Divider(
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return EditTextFieldPhoneHuerfano(phone: args["telefono"],);
                      },));
                    },
                    title: Text(args["telefono"]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Preciona para cambiar su telefono"),
                        Divider(
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return EditTextFieldBioHuerfano(bio: args["description"],);
                      },));
                    },
                    title: Text(args["description"]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Bio"),
                        Divider(
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return EditTextFieldUbiHuerfano(ubi: "Chiapas",);
                      },));
                    },
                    title: Text("Chiapas"),
                    subtitle: Text("Ubicacion"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              height: size.height * 0.3,
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
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: GlobalColor.primary,
                      backgroundImage: NetworkImage(args["img"]),
                    ),
                    title: const Text("Cambiar Imagen de perfil"),
                    subtitle:
                        const Text("Precione para cambiar su foto de perfil"),
                  ),
                  Divider(
                    height: 0,
                    indent: 80,
                  ),
                  ListTile(
                    leading: Container(
                      width: 60,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://images.pexels.com/photos/9977458/pexels-photo-9977458.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))),
                    ),
                    title: const Text("Cambiar Imagen de perfil"),
                    subtitle:
                        const Text("Precione para cambiar su foto de perfil"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
