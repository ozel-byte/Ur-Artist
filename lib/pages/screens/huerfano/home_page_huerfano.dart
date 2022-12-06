import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:urartist/pages/screens/artista/Browser.dart';
import 'package:urartist/pages/screens/buscador/buscador.dart';
import 'package:urartist/pages/screens/dashboard-artista/components/drawer.dart';
import 'package:urartist/pages/screens/huerfano/Browser.dart';
import 'package:urartist/pages/screens/huerfano/components/DrawerHuerfano.dart';
import 'package:urartist/utils/global_colors.dart';

class HomePageHuerfano extends StatefulWidget {
  const HomePageHuerfano({super.key});

  @override
  State<HomePageHuerfano> createState() => _HomePageHuerfanoState();
}

class _HomePageHuerfanoState extends State<HomePageHuerfano> {
  int showDisplay = 0;
  List<Widget> display = [
    Center(child: Text("Home")),
    Browserhuerfano(),
    Center(child: Text("Favorite")),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerHuerfano(user: {
        "nombre": "Nelson",
        "apellido": "Vazquez Guzman",
        "telefono": "9713808343",
        "email": "nelson@gmail.com",
        "type-user": "Huerfano",
        "description": "Bandea de rock echa en chiapas",
        "img":
            "https://images.pexels.com/photos/1987151/pexels-photo-1987151.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
      }),
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
              GestureDetector(
                child: CircleAvatar(backgroundColor: Colors.pink,),
              ),
              SizedBox(width: 10,)
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
                icon: Icon(Iconsax.heart), label: "favoritos")
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "upload-file");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
