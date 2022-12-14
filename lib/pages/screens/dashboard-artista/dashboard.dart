import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:urartist/pages/screens/buscador/buscador.dart';
import 'package:urartist/pages/screens/dashboard-artista/components/drawer.dart';
import 'package:urartist/utils/global_colors.dart';

class HomeComunidaad extends StatefulWidget {
  const HomeComunidaad({super.key});

  @override
  State<HomeComunidaad> createState() => _HomeComunidaadState();
}

class _HomeComunidaadState extends State<HomeComunidaad> {
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
      drawer: DrawerPersonality(typeUser: false,user: {
        "nombre": "Ozel",
        "apellido": "Vazquez Lopez",
        "telefono": "9713808343",
        "email": "ozelwelder@gmail.com",
        "type-user": "Comunidad",
        "ruta-name": "edit-profile-h",
        "description": "Me gusta mucho el  genero de cumbia y toco la bateria",
        "img" : "https://images.pexels.com/photos/1987151/pexels-photo-1987151.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
      }),
      appBar: AppBar(
        backgroundColor: GlobalColor.primary,
        title: const Text("Ur Artist"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, "buscador");
          }, icon: const Icon(Icons.search))
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
    );
  }

 
}
