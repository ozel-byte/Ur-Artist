import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:urartist/utils/global_colors.dart';

class DrawerPersonality extends StatefulWidget {
  bool? typeUser;
  Map<String, dynamic>? user;
  DrawerPersonality({super.key, this.typeUser, this.user});

  @override
  State<DrawerPersonality> createState() => _DrawerPersonalityState();
}

class _DrawerPersonalityState extends State<DrawerPersonality> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.28,
            decoration: widget.typeUser!
                ? const BoxDecoration(
                    color: GlobalColor.primary,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://images.pexels.com/photos/1047442/pexels-photo-1047442.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")))
                : const BoxDecoration(
                    color: GlobalColor.primary,
                  ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              NetworkImage(widget.user!["img"].toString()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person_outline_outlined,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    widget.user!["type-user"],
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        widget.user!["nombre"].toString(),
                        style: const TextStyle(
                            color: GlobalColor.bodyText,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(widget.user!["email"].toString(),
                          style: TextStyle(
                              color: GlobalColor.headlineText, fontSize: 14)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(widget.user!["telefono"].toString(),
                          style: TextStyle(
                              color: GlobalColor.headlineText, fontSize: 14)),
                    )
                  ]),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                   Navigator.pushNamed(context, widget.user!["ruta-name"],arguments: widget.user);
                  },
                  child: const ListTile(
                    leading: Icon(Icons.edit),
                    title: Text("Edit Profile"),
                  ),
                ),
                GestureDetector(
                  child: const ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Configuracion"),
                  ),
                ),
                GestureDetector(
                  child: const ListTile(
                    leading: Icon(Icons.logout_outlined),
                    title: Text("salir"),
                  ),
                ),
                GestureDetector(
                  child: const ListTile(
                    leading: Icon(Icons.question_mark_sharp),
                    title: Text("Ur artist Features"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
