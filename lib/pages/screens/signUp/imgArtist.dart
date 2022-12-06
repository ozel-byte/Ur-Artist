import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:urartist/pages/screens/signUp/presskit.dart';

import '../../../utils/global_colors.dart';



class ImgArtist extends StatefulWidget {
  Map<String,dynamic>? user;
   ImgArtist({super.key,this.user});

  @override
  State<ImgArtist> createState() => _ImgArtistState();
}

class _ImgArtistState extends State<ImgArtist> {

    File? imgProfile;
     File? imgBackground;
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
      height: size.height * 0.36,
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
                // List<int> imgbytes = imgProfile!.readAsBytesSync();
                // imgProfileBase64 = base64Encode(imgbytes);
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
          // GestureDetector(
          //   onTap: () {
          //     heightBottom = 350;
          //     showModalBottomSheet(
          //         isScrollControlled: true,
          //         context: context,
          //         enableDrag: true,
          //         builder: (context) {
          //           return BottomSheet(
          //               onClosing: () {
          //                 print("se cerro");
          //               },
          //               animationController:
          //                   BottomSheet.createAnimationController(this),
          //               builder: (context) {
          //                 currentIndexPresskit = 0;

          //                 return StatefulBuilder(builder: (context, setState) {
          //                   return Container(
          //                       height: heightBottom,
          //                       child: Column(
          //                         children: [
          //                           Container(
          //                             height: 300,
          //                             child: PageView(
          //                               controller: _pageController,
          //                               onPageChanged: (value) {
          //                                 setState(() {
          //                                   currentIndexPresskit = value;
          //                                   print("object");
          //                                   print(value);
          //                                 });
          //                               },
          //                               children: [
          //                                 Column(
          //                                   children: [
          //                                     Container(
          //                                       width: size.width,
          //                                       height: 300,
          //                                       child: Column(
          //                                         mainAxisAlignment:
          //                                             MainAxisAlignment
          //                                                 .spaceEvenly,
          //                                         children: [
          //                                           Row(
          //                                             mainAxisAlignment:
          //                                                 MainAxisAlignment
          //                                                     .spaceEvenly,
          //                                             children: [
          //                                               Column(
          //                                                 crossAxisAlignment:
          //                                                     CrossAxisAlignment
          //                                                         .start,
          //                                                 children: [
          //                                                  const Text(
          //                                                       "Año de formacion"),
          //                                                  const SizedBox(
          //                                                     height: 10,
          //                                                   ),
          //                                                   Container(
          //                                                       width:
          //                                                           size.width *
          //                                                               0.4,
          //                                                       decoration: BoxDecoration(
          //                                                           border: Border.all(
          //                                                               color: Colors
          //                                                                   .grey
          //                                                                   .withOpacity(
          //                                                                       0.5))),
          //                                                       child:
          //                                                           TextField(
          //                                                         controller:
          //                                                             _controllerformacion,
          //                                                         keyboardType:
          //                                                             TextInputType
          //                                                                 .number,
          //                                                         decoration: const InputDecoration(
          //                                                             border: InputBorder
          //                                                                 .none,
          //                                                             contentPadding:
          //                                                                 EdgeInsets.all(
          //                                                                     10),
          //                                                             hintText:
          //                                                                 "Ingrese su año de formacion"),
          //                                                       ))
          //                                                 ],
          //                                               ),
          //                                               Column(
          //                                                 crossAxisAlignment:
          //                                                     CrossAxisAlignment
          //                                                         .start,
          //                                                 children: [
          //                                                  const Text(
          //                                                       "Total de Integrantes"),
          //                                                  const SizedBox(
          //                                                     height: 10,
          //                                                   ),
          //                                                   Container(
          //                                                       width:
          //                                                           size.width *
          //                                                               0.4,
          //                                                       decoration: BoxDecoration(
          //                                                           border: Border.all(
          //                                                               color: Colors
          //                                                                   .grey
          //                                                                   .withOpacity(
          //                                                                       0.5))),
          //                                                       child:
          //                                                           TextField(
          //                                                         controller:
          //                                                             _controllerAllPersons,
          //                                                         keyboardType:
          //                                                             TextInputType
          //                                                                 .number,
          //                                                         decoration: const InputDecoration(
          //                                                             border: InputBorder
          //                                                                 .none,
          //                                                             contentPadding:
          //                                                                 EdgeInsets.all(
          //                                                                     10),
          //                                                             hintText:
          //                                                                 "Ingrese el total de los integrantes"),
          //                                                       ))
          //                                                 ],
          //                                               ),
          //                                             ],
          //                                           ),
          //                                           Column(
          //                                             crossAxisAlignment:
          //                                                 CrossAxisAlignment
          //                                                     .start,
          //                                             children: [
          //                                              const Text("Correo Contacto"),
          //                                              const SizedBox(
          //                                                 height: 10,
          //                                               ),
          //                                               Container(
          //                                                   width: size.width *
          //                                                       0.8,
          //                                                   decoration: BoxDecoration(
          //                                                       border: Border.all(
          //                                                           color: Colors
          //                                                               .grey
          //                                                               .withOpacity(
          //                                                                   0.5))),
          //                                                   child: TextField(
          //                                                     controller:
          //                                                         _controllerEmailContactPresskit,
          //                                                     onTap: () {
          //                                                       print("hola");
          //                                                       setState(
          //                                                         () {
          //                                                           heightBottom =
          //                                                               size.height *
          //                                                                   0.8;
          //                                                         },
          //                                                       );
          //                                                     },
          //                                                     decoration: const InputDecoration(
          //                                                         contentPadding:
          //                                                             EdgeInsets
          //                                                                 .all(
          //                                                                     10),
          //                                                         border:
          //                                                             InputBorder
          //                                                                 .none,
          //                                                         hintText:
          //                                                             "Ingrese su correo de contacto"),
          //                                                   ))
          //                                             ],
          //                                           ),
          //                                         ],
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                                 Container(
          //                                   height: 300,
          //                                   child: Column(
          //                                     mainAxisAlignment:
          //                                         MainAxisAlignment.spaceEvenly,
          //                                     children: [
          //                                       Column(
          //                                         crossAxisAlignment:
          //                                             CrossAxisAlignment.start,
          //                                         mainAxisAlignment:
          //                                             MainAxisAlignment
          //                                                 .spaceEvenly,
          //                                         children: [
          //                                          const Text("Genero"),
          //                                          const SizedBox(
          //                                             height: 10,
          //                                           ),
          //                                           FutureBuilder(
          //                                             future: ApiServices().getGen(),
          //                                             builder: (context, AsyncSnapshot<List<String>> snapshot) {
          //                                               if (snapshot.hasData) {
                                                          
          //                                                 return Container(
          //                                               width: size.width * 0.8,
          //                                               decoration: BoxDecoration(
          //                                                   border: Border.all(
          //                                                       color: Colors
          //                                                           .grey
          //                                                           .withOpacity(
          //                                                               0.5))),
          //                                               child: DropdownButton(
          //                                                 isExpanded: true,
          //                                                 itemHeight: null,
          //                                                 value: genDrow,
          //                                                 items: snapshot.data!.map<
          //                                                     DropdownMenuItem<
          //                                                         String>>((e) {
          //                                                   return DropdownMenuItem(
          //                                                     value: e,
          //                                                     child: Text(e),
          //                                                   );
          //                                                 }).toList(),
          //                                                 onChanged: (value) {
          //                                                   setState(
          //                                                     () {
          //                                                   genDrow = value!;

          //                                                     },
          //                                                   );
          //                                                 },
          //                                               ));
          //                                               }else{
          //                                                 return const CircularProgressIndicator();
          //                                               }
          //                                             },
          //                                           )
          //                                         ],
          //                                       ),
          //                                       Column(
          //                                         crossAxisAlignment:
          //                                             CrossAxisAlignment.start,
          //                                         children: [
          //                                           const Text(
          //                                               "Link a su contenido en plataformas externas"),
          //                                           SizedBox(
          //                                             height: 10,
          //                                           ),
          //                                           Container(
          //                                               width: size.width * 0.8,
          //                                               decoration: BoxDecoration(
          //                                                   border: Border.all(
          //                                                       color: Colors
          //                                                           .grey
          //                                                           .withOpacity(
          //                                                               0.5))),
          //                                               child: TextField(
          //                                                 maxLines: 5,
          //                                                 controller:
          //                                                     _controllerLinkContenido,
          //                                                 decoration: const InputDecoration(
          //                                                     contentPadding:
          //                                                         EdgeInsets
          //                                                             .all(10),
          //                                                     border:
          //                                                         InputBorder
          //                                                             .none,
          //                                                     hintText:
          //                                                         "Ingrese los links"),
          //                                               ))
          //                                         ],
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 )
          //                               ],
          //                             ),
          //                           ),
          //                           GestureDetector(
          //                             onTap: () {
          //                               if (currentIndexPresskit == 0) {
          //                                 _pageController.jumpToPage(1);
          //                               } else if (currentIndexPresskit == 1) {
          //                                 savePresskitFunc();
          //                                 Navigator.pop(context);
          //                               }
          //                             },
          //                             child: Container(
          //                               width: size.width * 0.8,
          //                               height: size.height * 0.06,
          //                               color: GlobalColor.primary,
          //                               child: Center(
          //                                   child: Text(
          //                                 currentIndexPresskit == 0
          //                                     ? "Siguiente"
          //                                     : "Guardar",
          //                                 style: TextStyle(
          //                                     color: Colors.white,
          //                                     fontSize: 18,
          //                                     fontWeight: FontWeight.bold),
          //                               )),
          //                             ),
          //                           )
          //                         ],
          //                       ));
          //                 });
          //               });
          //         });
          //   },
          //   child: ListTile(
          //     leading: const Icon(Icons.present_to_all_sharp),
          //     title: Text("Agregar presskit"),
          //     trailing: savePresskit
          //         ? ZoomIn(
          //             child: const Icon(
          //               Icons.check_circle,
          //               color: GlobalColor.primary,
          //             ),
          //           )
          //         : const Text(""),
          //   ),
          // )
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        if (imgProfile != null && imgBackground != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Presskit(
              infoUser: widget.user,
              photos: {
                "photo-profile":imgProfile!.path,
                "photo-background": imgBackground!.path
              },
            );
          },));
        }else{
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Seleciona una imagen")));
        }
      },
      child: const Icon(Icons.arrow_forward),
    ),
    );
  }
}