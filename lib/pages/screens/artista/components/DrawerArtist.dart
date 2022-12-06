import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:urartist/controller/saveUserSharedPreferences.dart';
import 'package:urartist/utils/global_colors.dart';

class DrawerArtist extends StatefulWidget {
  DrawerArtist({super.key});

  @override
  State<DrawerArtist> createState() => _DrawerArtistState();
}

class _DrawerArtistState extends State<DrawerArtist> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        children: [
          FutureBuilder(
            future: SaveUserSharedPreferences().getUser(),
            builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
              if (snapshot.hasData) {
                return Container(
                  width: size.width,
                  height: size.height * 0.28,
                  decoration: BoxDecoration(
                      color: GlobalColor.primary,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              NetworkImage(snapshot.data!["photo_portada"]))),
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
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    
                                    borderRadius: BorderRadius.circular(50)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 33,
                                      backgroundImage: NetworkImage(
                                          snapshot.data!["photo_profile"]),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.person_outline_outlined,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Artist",
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
                              snapshot.data!["name_artistic"],
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
                            child: Text(snapshot.data!["email"],
                                style: TextStyle(
                                    color: GlobalColor.headlineText,
                                    fontSize: 14)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ]),
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "edit-info-list-artist");
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
                  onTap: () async {
                    print("llego hasta aqui");
                    await SaveUserSharedPreferences().remove();
                    if (mounted) {
                      Navigator.pushNamed(context, "login");
                    }
                  },
                  child: const ListTile(
                    
                    leading: const Icon(Icons.logout_outlined),
                    title: const Text("salir"),
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
