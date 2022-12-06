import 'package:flutter/material.dart';
import 'package:urartist/controller/saveUserSharedPreferences.dart';
import 'package:urartist/pages/screens/artista/edit_textField_bio.dart';
import 'package:urartist/pages/screens/artista/edit_textField_email.dart';
import 'package:urartist/pages/screens/artista/edit_textField_name.dart';
import 'package:urartist/pages/screens/artista/edit_textField_phone.dart';
import 'package:urartist/utils/global_colors.dart';

class EditInfoListArtist extends StatefulWidget {
  const EditInfoListArtist({
    super.key,
  });

  @override
  State<EditInfoListArtist> createState() => _EditInfoListArtistState();
}

class _EditInfoListArtistState extends State<EditInfoListArtist> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    

    return FutureBuilder(
      future: SaveUserSharedPreferences().getUser(),
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
              child: Text(snapshot.data!["name_artistic"]),
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
                 const SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return EditTextFieldNameArtist(nombre: snapshot.data,);
                    },)),
                    child: ListTile(
                      title: Text(snapshot.data!["name_artistic"]),
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
                         return EditTextFieldEmailArtist(email: snapshot.data,);
                       },));
                    },
                    title: Text(snapshot.data!["email"]),
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
                  
                  // ListTile(
                  //   onTap: () {
                  //     Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //       return EditTextFieldPhoneArtist(phone: args["telefono"],);
                  //     },));
                  //   },
                  //   title: Text(snapshot.data[""]),
                  //   subtitle: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: const [
                  //       Text("Preciona para cambiar su telefono"),
                  //       Divider(
                  //         color: Colors.grey,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                 
                  ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return EditTextFieldBioArtist(bio: snapshot.data,);
                      },));
                    },
                    title: Text(snapshot.data!["brief_description"]),
                    subtitle: Text("Bio"),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              height: size.height*0.13,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20,top: 20),
                    child: Text("Presskit", style: TextStyle(
                            color: GlobalColor.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),),
                  ),
                  ListTile(
                    leading: Icon(Icons.view_compact_sharp),
                    title: Text("Editar Presskit"),
                  ),
                ],
              ),
            ),
           const SizedBox(
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
                      backgroundImage: NetworkImage(snapshot.data!["photo_profile"]),
                    ),
                    title: const Text("Cambiar Imagen de perfil"),
                    subtitle:
                        const Text("Precione para cambiar su foto de perfil"),
                  ),
                 const Divider(
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
                        image:  DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(snapshot.data!["photo_portada"]))
                      ),
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
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
