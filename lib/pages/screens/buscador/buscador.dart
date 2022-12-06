import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:urartist/controller/services.dart';
import 'package:urartist/utils/global_colors.dart';

class Buscador extends StatefulWidget {
  const Buscador({super.key});

  @override
  State<Buscador> createState() => _BuscadorState();
}

class _BuscadorState extends State<Buscador> {
  TextEditingController _textEditingController = TextEditingController();
  String valueSearch = "";

  bool typing = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.grey,
              )),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: TextField(
            controller: _textEditingController,
            onChanged: (value) {
              setState(() {
              valueSearch = value;
              });
            },
            autofocus: true,
            decoration: const InputDecoration(
                hintText: "buscar",
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 3)),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  _textEditingController.text = "";
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.grey,
                )),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: Column(
          children: [
            TabBar(
              labelColor: GlobalColor.primary,
              isScrollable: true,
              unselectedLabelColor: Colors.black.withOpacity(0.6),
              tabs: const [
                Tab(
                  text: "Artist",
                ),
                Tab(
                  text: "Cumbia",
                ),
                Tab(
                  text: "Rock",
                ),
                Tab(
                  text: "Sala",
                ),
                Tab(
                  text: "Indie",
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  artist(),
                 const Icon(Icons.queue_music),
                 const Icon(Icons.music_note_outlined),
                  const Icon(Icons.queue_music),
                  const Icon(Icons.queue_music)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  artist() {
    return FutureBuilder(
      future: ApiServices().search(valueSearch),
      builder: (context,AsyncSnapshot<Map<String,dynamic>> snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data!["status"]);
          print(snapshot.data!["data"]);
          if (snapshot.data!["status"] == StatusAccount.serviceUnavailable) {
            return const Center(child:  Text("Problemas con el servidor"));
          }

          if (snapshot.data!["status"] == StatusAccount.badGateway) {
             return  const Center(child: Text("Servicio no disponible"));
          }

          return ListView.builder(
            itemCount: snapshot.data!["data"].length,
            itemBuilder: (context, index) {
              return 
               ListTile(
                onTap: () {
                  Navigator.pushNamed(context, "perfil-artist-view-client",arguments: {
                    "id": snapshot.data!["data"][index]["id"]
                  });
                },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        snapshot.data!["data"][index]["photo_profile"]),
                  ),
                  title: Text(snapshot.data!["data"][index]["name_artistic"]),
                  subtitle: Text("Artista"),
                );
            },
          );
        } else {
          return const Center(child:  CircularProgressIndicator());
        }
      },
    );
  }
}
