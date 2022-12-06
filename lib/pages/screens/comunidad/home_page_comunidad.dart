import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:urartist/pages/screens/buscador/buscador.dart';
import 'package:urartist/pages/screens/comunidad/components/drawer.dart';
import 'package:urartist/pages/screens/dashboard-artista/components/drawer.dart';
import 'package:urartist/utils/global_colors.dart';

class HomePageCommunity extends StatefulWidget {
  const HomePageCommunity({super.key});

  @override
  State<HomePageCommunity> createState() => _HomePageCommunityState();
}

class _HomePageCommunityState extends State<HomePageCommunity> {
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
      drawer: DrawerCommunity(),
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
