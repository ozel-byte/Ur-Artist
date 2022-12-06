import 'package:flutter/material.dart';
import 'package:urartist/controller/saveUserSharedPreferences.dart';
import 'package:urartist/controller/services.dart';
import 'package:urartist/utils/global_colors.dart';

class ProfileArtist extends StatelessWidget {
  const ProfileArtist({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
      future: SaveUserSharedPreferences().getUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Background(size: size,background: snapshot.data!["photo_portada"]),
                Positioned(
                  left: size.width * 0.05,
                  top: size.height * 0.2,
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: SingleChildScrollView(
                      child: Column(
                        children:  [
                          NameUser(name: snapshot.data!["name_artistic"]),
                         const SizedBox(
                            height: 10,
                          ),
                         const Divider(),
                         FutureBuilder<Map<String,dynamic>>(
                          future: ApiServices().getPresskit(snapshot.data!["id_preskkit"]),
                          builder: (context,AsyncSnapshot<Map<String,dynamic>> snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: [
                                   ListTile(
                            leading: const Icon(Icons.phone_callback_sharp),
                            title: const Text("Telefono"),
                            subtitle: Text(snapshot.data!["telefono"]),
                          ),
                          ListTile(
                            leading: const Icon(Icons.email),
                            title: const Text("Correo"),
                            subtitle: Text(snapshot.data!["correo_contacto"]),
                          ),
                          ListTile(
                            leading: const Icon(Icons.music_note),
                            title: const Text("Genero"),
                            subtitle: Text(snapshot.data!["genero"]),
                          ),
                                ],
                              );
                            }else{
                              return const CircularProgressIndicator();
                            }
                          },
                         ),
                         const Divider(),
                         const PhotosUser(),
                         const Divider(),
                         const Review(),
                        ],
                      ),
                    ),
                  ),
                ),
                ProfileUser(size: size,profileFoto: snapshot.data!["photo_profile"]),
              ],
            ),
          );
        } else {
          return const Center(child:  CircularProgressIndicator());
        }
      },
    ));
  }
}

class NameUser extends StatelessWidget {
  final String? name;
  const NameUser({
    Key? key,
    this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
          child: Text(
            name!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: const [
              Icon(
                Icons.location_on,
                color: Colors.grey,
                size: 16,
              ),
              Text("  Ixtepec", style: TextStyle(color: Colors.grey)),
            ],
          ),
        )
      ],
    );
  }
}

class Review extends StatelessWidget {
  const Review({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Comentarios",
            style: TextStyle(fontSize: 18),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                leading: CircleAvatar(
                  radius: 20,
                ),
                title: Text("Ozel"),
                subtitle: Text("Ranking: 5"),
              ),
              Text(
                  "El mejor grupo ehhhh buena musica y ambiente, lo recomiendo")
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                leading: CircleAvatar(
                  radius: 20,
                ),
                title: Text("Azze"),
                subtitle: Text("Ranking: 15"),
              ),
              Text(
                  "El mejor grupo ehhhh buena musica y ambiente, lo recomiendo")
            ],
          ),
        ],
      ),
    );
  }
}

class PhotosUser extends StatelessWidget {
  const PhotosUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Photos",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey.withOpacity(0.3),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey.withOpacity(0.3),
                        child: Center(child: Text("Mas")),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ProfileUser extends StatelessWidget {
  final String? profileFoto;
  const ProfileUser({
    Key? key,
    required this.size, required this.profileFoto
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: size.width * 0.7,
        bottom: size.height * 0.76,
        child:  CircleAvatar(
          radius: 35,
          backgroundColor: Colors.black,
          backgroundImage: NetworkImage(profileFoto!),
        ));
  }
}

class Background extends StatelessWidget {
  final String? background;
  const Background({
    Key? key,
    required this.size,
    required this.background
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.grey.withOpacity(0.2),
      child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.4,
            decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(background!))
            ),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.04,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        decoration: BoxDecoration(
                        color: GlobalColor.primary,
                        borderRadius: BorderRadius.circular(50)
                        ),
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: GlobalColor.primary,
                        borderRadius: BorderRadius.circular(50)
                        ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search, color: Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: GlobalColor.primary,
                          borderRadius: BorderRadius.circular(50)
                          ),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert, color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
