import 'package:flutter/material.dart';
import 'package:urartist/controller/saveUserSharedPreferences.dart';
import 'package:urartist/pages/screens/comunidad/edit_textField_lastname.dart';
import 'package:urartist/pages/screens/comunidad/edit_textfield_email.dart';
import 'package:urartist/pages/screens/comunidad/edit_textfield_name.dart';
import 'package:urartist/pages/screens/comunidad/edit_textfield_phone.dart';
import 'package:urartist/utils/global_colors.dart';

class EditInfoListCommunity extends StatefulWidget {
  EditInfoListCommunity({
    super.key,
  });

  @override
  State<EditInfoListCommunity> createState() => _EditInfoListCommunityState();
}

class _EditInfoListCommunityState extends State<EditInfoListCommunity> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    

    return FutureBuilder(
      future: SaveUserSharedPreferences().getUserCommunity(),
       builder: (context, snapshot) {
         if (snapshot.hasData) {
           return  Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: GlobalColor.primary,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(snapshot.data!["photo_profile"]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(snapshot.data!["name"]),
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
              height: size.height * 0.4,
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
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      
                      builder: (context) {
                      return EditTextFieldNameCommunity(
                        nombre: snapshot.data,
                      );
                    },)),
                    child: ListTile(
                      title: Text(snapshot.data!["name"]),
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
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return EditTextFieldLastNameCommunity(
                        lastName: snapshot.data,
                      );
                    },)),

                    child: ListTile(
                      title: Text(snapshot.data!["lastname"]),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Apellidos"),
                          Divider(
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                 
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return EditTextFieldEmailCommunity(
                        email: snapshot.data,
                      );
                    },)),

                    child: ListTile(
                      title: Text(snapshot.data!["mail"]),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:const [
                          Text("correo"),
                          Divider(
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return EditTextFieldPhoneCommunity(
                        phone: snapshot.data,
                      );
                    },)),

                    child: ListTile(
                      title: Text(snapshot.data!["number_phone"]),
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
                  ),
                ],
              ),
            ),
          const  SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              height: size.height * 0.2,
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
                    onTap: () {
                      
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: GlobalColor.primary,
                      backgroundImage: NetworkImage(snapshot.data!["photo_profile"]),
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
         }else{
          return const Center(child: CircularProgressIndicator());
         }
       },
    );
  }

 Column pattern(){
    return Column(
      children: [
        Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text:
                            "El nombre de usuario debe ser Unico y legible en ",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 14)),
                    TextSpan(
                        text: "UrArtist ",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            "esto para que las personas puedan encontrarte mas facilmente y no pueda haber nombres repetidos de bandas",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8), fontSize: 14))
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text:
                            "Tu puedes usar letras con numeros para el nombre de usuario ",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 14)),
                    TextSpan(
                        text: "a-z 0-9.",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: Text("Minimo debe contener 3 letras y maximo 15",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8), fontSize: 14)),
              )
      ],
    );
  }
}
