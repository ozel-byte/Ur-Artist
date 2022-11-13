import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:urartist/pages/screens/dashboard-artista/components/drawer.dart';
import 'package:urartist/utils/global_colors.dart';

class HomeHuerfano extends StatefulWidget {
  const HomeHuerfano({super.key});

  @override
  State<HomeHuerfano> createState() => _HomeHuerfanoState();
}

class _HomeHuerfanoState extends State<HomeHuerfano> {
  int showDisplay = 0;
  List<Widget> display = [
    Center(child: Text("Home")),
    Center(child: Text("Browser")),
    Center(child: Text("Buscador")),
    Center(child: Text("Favorite")),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerPersonality(typeUser: true,user: {
        "nombre": "Nelson",
        "telefono": "9713808343",
        "email": "NelsonVazquez@gmail.com",
        "type-user": "Huerfano",
        "img" : "https://images.pexels.com/photos/1699161/pexels-photo-1699161.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
      }),
      appBar: AppBar(
        backgroundColor: GlobalColor.primary,
        title: const Text("Ur Artist"),
        actions:  [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "profile-huerfano");
            },
            child: const CircleAvatar(
              backgroundImage: NetworkImage("https://images.pexels.com/photos/5648352/pexels-photo-5648352.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
            ),
          ),
        const  SizedBox(width: 10,)
        ],
        
      ),
      body: display[showDisplay],
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
                icon: Icon(Iconsax.search_favorite), label: "buscador"),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.heart), label: "favoritos")
          ]),
    );
  }

  Widget home() {
    return const Center(child: Text("Home"));
  }

  browser() {
    return const Center(child: Text("Browser"));
  }

  search() {
    return const Center(child: Text("search"));
  }

  favorite() {
    return const Center(child: Text("favorite"));
  }
}
