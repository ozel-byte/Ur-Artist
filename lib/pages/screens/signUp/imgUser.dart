import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:urartist/controller/services.dart';
import 'package:urartist/pages/screens/signUp/presskit.dart';

import '../../../utils/global_colors.dart';



class ImgUser extends StatefulWidget {
  Map<String,dynamic>? user;
   ImgUser({super.key,this.user});

  @override
  State<ImgUser> createState() => _ImgArtistState();
}

class _ImgArtistState extends State<ImgUser> {

    File? imgProfile;
     File? imgBackground;
     bool loading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Foto del artista"),
      ),
      body: Container(
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
          GestureDetector(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();

              if (result != null) {
                imgProfile = File(result.files.single.path!);
                setState(() {});
                
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
              title: const Text("Cambiar Imagen de perfil"),
              subtitle:const Text("Precione para cambiar su foto de perfil"),
            ),
          ),
        const  Divider(
            indent: 20,
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () async{
        if (imgProfile != null) {
          setState(() {
            loading = true;
          });
          final response = await ApiServices().createComunidad(
            {
              "name":widget.user!["name"],
              "lastname": widget.user!["lastName"],
              "password":widget.user!["password"],
              "number_phone"  : widget.user!["phone"],
              "mail": widget.user!["email"],
              "photo_profile": imgProfile!.path
            }
          );
          if (response == StatusAccount.successfully) {
            if (mounted) {
              setState(() {
                loading = false;
              });
            Navigator.pushNamed(context, "home-page-community");
            }
          }
        }else{
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Seleciona una imagen")));
        }
      },
      child:
      loading ? const CircularProgressIndicator(color: Colors.white,) : 
       const Icon(Icons.arrow_forward),
    ),
    );
  }
}