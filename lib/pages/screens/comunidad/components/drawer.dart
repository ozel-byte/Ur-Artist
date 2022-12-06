import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:urartist/controller/saveUserSharedPreferences.dart';
import 'package:urartist/utils/global_colors.dart';

class DrawerCommunity extends StatefulWidget {
  DrawerCommunity({super.key});

  @override
  State<DrawerCommunity> createState() => _DrawerCommunityState();
}

class _DrawerCommunityState extends State<DrawerCommunity> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        children: [
          FutureBuilder(
            future: SaveUserSharedPreferences().getUserCommunity(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  width: size.width,
                  height: size.height * 0.28,
                  decoration: const BoxDecoration(
                      color: GlobalColor.primary,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://images.pexels.com/photos/14339337/pexels-photo-14339337.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"))),
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
                                backgroundImage: NetworkImage(
                                    snapshot.data!["photo_profile"]),
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
                                          "Comunidad",
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
                              snapshot.data!["name"] +
                                  " " +
                                  snapshot.data!["lastname"],
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
                            child: Text(snapshot.data!["mail"],
                                style: TextStyle(
                                    color: GlobalColor.headlineText,
                                    fontSize: 14)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(snapshot.data!["number_phone"],
                                style: TextStyle(
                                    color: GlobalColor.headlineText,
                                    fontSize: 14)),
                          )
                        ]),
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "edit-info-list-community");
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
