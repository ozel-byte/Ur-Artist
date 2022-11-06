import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:urartist/pages/screens/perfil-artista/perfil_artista.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with TickerProviderStateMixin {
  double scale = 1.0;
  bool moveleft = false;
  Animation<double>? _scale;
  AnimationController? _animationController;
  double _scaleBack = 1.0;
  bool displayDivide = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _scale = Tween(begin: 1.0, end: 0.8).animate(
        CurvedAnimation(parent: _animationController!, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          profile(size),
          Positioned(
              left: moveleft ? size.width * 0.5 : 0.0,
              child: displayDivide
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          scale = 1.0;
                          moveleft = false;
                          displayDivide = false;
                          _animationController!.reverse();
                        });
                      },
                      child: home(size),
                    )
                  : home(size))
        ],
      ),
    );
  }

  Container profile(Size size) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.9),
        image: DecorationImage(
          fit: BoxFit.cover,
          opacity: 0.3,
          image: NetworkImage("https://images.pexels.com/photos/1327426/pexels-photo-1327426.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
      ),
     child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/1327426/pexels-photo-1327426.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                child: Text("A"),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Hi, Mala Racha",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Container(
                width: size.width * 0.5,
                height: size.height * 0.4,
                child: ListView(
                  children: const [
                    ListTile(
                      title: Text("Account",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    ListTile(
                      title: Text("settings",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      leading: Icon(Icons.settings, color: Colors.white),
                    ),
                    ListTile(
                      title: Text("logout",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      leading: Icon(Icons.logout, color: Colors.white),
                    ),
                    ListTile(
                      title: Text("Edit Information",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      leading: Icon(Icons.edit, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
          ),
      
    );
  }

  Widget home(Size size) {
    return Transform.scale(
      scale: displayDivide ? _scale!.value : _scaleBack,
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Ur Artist",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PerfilArtista();
                  },));
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/1327426/pexels-photo-1327426.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                ),
              ),
              SizedBox(width: 10,)
            ],
            leading: IconButton(
                onPressed: () {
                  setState(() {
                    scale = 0.8;
                    moveleft = true;
                    displayDivide = true;
                    _animationController!.forward();
                  });
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                )),
          ),
          body: Center(child: Text("Hoala")),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.photo_camera_front), label: "Brower"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "favorite"),

          ]),
        ),
      ),
    );
  }

  Container appBar(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.1,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    scale = 0.8;
                    moveleft = true;
                    displayDivide = true;
                    _animationController!.forward();
                  });
                },
                child: const CircleAvatar(
                  radius: 20,
                  child: Text("A"),
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/12993543/pexels-photo-12993543.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                ),
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              Icon(Icons.notification_add),
              SizedBox(
                width: size.width * 0.07,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome, Ozel",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text("What band would like your today?",
                      style: TextStyle(color: Colors.grey))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
