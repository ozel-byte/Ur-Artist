import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:urartist/controller/saveUserSharedPreferences.dart';
import 'package:urartist/controller/services.dart';
import 'package:urartist/utils/global_colors.dart';
import 'package:dotted_border/dotted_border.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({super.key});

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  bool imageSelected = false;
  File? img;
  bool uploading = false;
  final TextEditingController _editingController = TextEditingController();
  bool statusBio = false;
  String valueBio = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIdUser();
  }

  getIdUser() async {
    Map<String, dynamic> id = await SaveUserSharedPreferences().getUser();
    print(id["id"]);
    return id["id"];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.1,
          title: const Text("Compartir Publicacion"),
          actions: [
            IconButton(
                onPressed: () async {
                  if (img != null && valueBio.isNotEmpty) {
                    setState(() {
                      uploading = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(),
                        content: Text("Subiendo post")));
                    
                    final id = await getIdUser();
                    final response = await ApiServices().post({
                      "id_artista": id,
                      "descripcion": valueBio,
                      "img": img!.path
                    });

                    setState(() {
                      uploading = false;
                    });

                    if (response == StatusAccount.successfully) {
                      if (mounted) {
                      Navigator.pop(context);
                    }
                    }
                    
                    if(response == StatusAccount.errorTimeOut){
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("El servidor no responde intente mas tarde")));
                      }
                    }
                    
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: GlobalColor.primary,
                        content:
                            Text("Selecione una imagen o rellena el campo")));
                  }
                },
                icon: const Icon(Icons.check))
          ],
        ),
        body:FutureBuilder(
          future: SaveUserSharedPreferences().getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(snapshot.data!["photo_profile"]),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          snapshot.data!["name_artistic"],
                          style:const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                     const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("Artista",
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: 
              IconButton(
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();
                    img = File(result!.files.single.path!);
                    setState(() {});
                  },
                  icon: Icon(Icons.photo_camera_back_outlined)),
            ),
            Container(
              width: size.width,
              height: size.height * 0.2,
              
              child: TextField(
                maxLines: 5,
                onChanged: (value) {
                  setState(() {
                    valueBio = value;
                  });
                },
                decoration: InputDecoration(
                  
                    hintText: "Escribe algo...",
                    counterText: "${valueBio.length}/50",
                    helperText: valueBio.length > 50 ? "Maximo 20 caracteres" : "",
                    counterStyle: TextStyle(color: valueBio.length>=50 ? Colors.red: Colors.grey),
                    contentPadding:
                        const EdgeInsets.only(left: 20, top: 20),
                    border: InputBorder.none),
              ),
            ),
            
           Divider(),
           img != null ? Padding(
             padding: const EdgeInsets.only(left: 20),
             child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.red,
                      backgroundImage: FileImage(img!),
                    ),
                    const Padding(
                      padding:  EdgeInsets.only(left: 10),
                      child: Text("Imagen cargada"),
                    )
                  ],
                ),
           ) : Container(),
          

            // GestureDetector(
            //   onTap: () async {
            //     FilePickerResult? result =
            //         await FilePicker.platform.pickFiles();
            //     img = File(result!.files.single.path!);
            //     setState(() {});
            //   },
            //   child: DottedBorder(
            //     color: GlobalColor.primary,
            //     dashPattern: const [7, 7, 7, 7],
            //     radius: const Radius.circular(10),
            //     strokeWidth: 1,
            //     borderType: BorderType.RRect,
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(10),
            //       child: Container(
            //         width: size.width * 0.8,
            //         height: size.height * 0.2,
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         child: Center(
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: const [
            //               Image(
            //                   height: 70,
            //                   image: AssetImage(
            //                       "assets/carpeta-abierta.png")),
            //               Text(
            //                 "Precione para subir\n una foto o video",
            //                 style: TextStyle(color: Colors.grey),
            //                 textAlign: TextAlign.center,
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.05,
            // ),
            // Container(
            //   width: size.width * 0.8,
            //   height: size.height * 0.2,
            //   decoration: img != null
            //       ? BoxDecoration(
            //           image: DecorationImage(
            //               fit: BoxFit.cover, image: FileImage(img!)))
            //       : const BoxDecoration(),
            //   child: Column(
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: GestureDetector(
            //                 onTap: () {
            //                   img = null;
            //                   setState(() {});
            //                 },
            //                 child: img != null
            //                     ? Container(
            //                         decoration: BoxDecoration(
            //                             color: Colors.white,
            //                             borderRadius:
            //                                 BorderRadius.circular(30)),
            //                         child: const Icon(
            //                           Icons.close,
            //                           color: GlobalColor.primary,
            //                         ))
            //                     : Container()),
            //           )
            //         ],
            //       ),
            //     ],
            //   ),
            // )
          ],
        );
            }else{
              return const CircularProgressIndicator();
            }
          },
        )
        );
  }
}
