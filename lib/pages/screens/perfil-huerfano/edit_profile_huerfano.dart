import 'package:flutter/material.dart';
import 'package:urartist/utils/global_colors.dart';

class EditProfileH extends StatefulWidget {
  EditProfileH({
    super.key,
  });

  @override
  State<EditProfileH> createState() => _EditProfileHState();
}

class _EditProfileHState extends State<EditProfileH> {
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
              height: size.height * 0.45,
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
                    onTap: () => Navigator.pushNamed(context, "input-edit",arguments: args),
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
                    title: Text(args["apellido"]),
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
                 
                  ListTile(
                    title: Text(args["email"]),
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
                  
                  ListTile(
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
                    title: Text(args["description"]),
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
