import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:urartist/controller/saveUserSharedPreferences.dart';
import 'package:urartist/pages/screens/artista/components/DrawerArtist.dart';
import 'package:urartist/pages/screens/buscador/buscador.dart';
import 'package:urartist/pages/screens/dashboard-artista/components/drawer.dart';
import 'package:urartist/utils/global_colors.dart';

class HomePageArtist extends StatefulWidget {
  const HomePageArtist({super.key});

  @override
  State<HomePageArtist> createState() => _HomePageArtistState();
}

class _HomePageArtistState extends State<HomePageArtist> {
  int showDisplay = 0;
  List<Widget> display = [
    Center(child: Text("Home")),
    Center(child: Text("Browser")),
    Center(child: Text("Favorite")),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerArtist(),
      appBar: AppBar(
        backgroundColor: GlobalColor.primary,
        title: const Text("Ur Artist"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "buscador");
              },
              icon: const Icon(Icons.search)),
          FutureBuilder(
            future: SaveUserSharedPreferences().getUserCommunity(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "profile_artist");
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(snapshot.data!["photo_profile"]),
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: display[showDisplay],
      floatingActionButton: FloatingActionButton(
        backgroundColor: GlobalColor.primary,
        onPressed: () {
          Navigator.pushNamed(context, "upload-file");
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: GlobalColor.primary,
          onTap: (value) {
            setState(() {
              showDisplay = value;
              print(value);
            });
          },
          currentIndex: showDisplay,
          items: const [
            BottomNavigationBarItem(icon: Icon(Iconsax.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.video), label: "browser"),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.heart), label: "favoritos")
          ]),
    );
  }
}
