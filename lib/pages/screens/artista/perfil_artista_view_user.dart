import 'package:flutter/material.dart';
import 'package:urartist/controller/saveUserSharedPreferences.dart';
import 'package:urartist/controller/services.dart';

import '../../../utils/global_colors.dart';

class PerfilArtistViewUser extends StatefulWidget {
  const PerfilArtistViewUser({super.key});

  @override
  State<PerfilArtistViewUser> createState() => _PerfilArtistav2State();
}

class _PerfilArtistav2State extends State<PerfilArtistViewUser> {
  ScrollController _scrollController = ScrollController();
  ScrollController _scrollControllerGrid = ScrollController();
  bool activeTextAppBar = false;
  bool activePhotoAppBar = false;
  bool activeGridScroll = false;
  bool viewImageFullScreen = false;
  String imgSelected = "";
  String description = "";
 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollControllerGrid.addListener(() {
      if (activePhotoAppBar) {
        print(_scrollControllerGrid.position.minScrollExtent + 50);
        print(_scrollControllerGrid.position.pixels);
        if (_scrollControllerGrid.position.pixels ==
            _scrollControllerGrid.position.minScrollExtent) {
         
          setState(() {
            activeGridScroll = false;
          });
        } else {
          if (activePhotoAppBar) {
            setState(() {
              activeGridScroll = true;
            });
          }
        }
      }
    });
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        setState(() {});
        _scrollControllerGrid.animateTo(300,
            duration: const Duration(seconds: 2), curve: Curves.ease);
      }
      if (_scrollController.position.pixels > 130) {
        setState(() {
          activeTextAppBar = true;
        });
      }

      if (_scrollController.position.pixels > 280) {
        setState(() {
          activePhotoAppBar = true;
        });
      }
      if (_scrollController.position.pixels < 100) {
        setState(() {
          activeTextAppBar = false;
          activePhotoAppBar = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: SaveUserSharedPreferences().getUser(),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
          return  Stack(
            children: [
              CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
              title: activeTextAppBar
                  ?  Text(
                     snapshot.data!["name_artistic"],
                      style: TextStyle(color: Colors.black),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Text("Artista"), Icon(Icons.verified)],
                    ),
              backgroundColor: Colors.white,
              expandedHeight: 400,
              centerTitle: true,
              actions: [
                activePhotoAppBar
                    ?  Padding(
                        padding:const EdgeInsets.only(top: 10),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(snapshot.data!["photo_profile"]),
                        ),
                      )
                    : Container()
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Stack(
                      children: [
                         Image(
                          width: size.width,
                          height: size.height*0.32,
                            fit: BoxFit.cover,
                            image: NetworkImage(snapshot.data!["photo_portada"])),
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 0.28,
                                    left: size.width * 0.05),
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                          image:
                                              NetworkImage(snapshot.data!["photo_profile"])),
                                      border: Border.all(color: Colors.white,width: 3)),
                                )),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.03, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            snapshot.data!["name_artistic"],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                              snapshot.data!["brief_description"],
                              style:
                                  const TextStyle(color: Colors.grey, fontSize: 16))
                        ],
                      ),
                    )
                  ],
                ),
              )),
          SliverList(delegate: SliverChildListDelegate([tabs(size,snapshot)]))
        ],
      ),
                      viewImageFullScreen
            ? Positioned(
                left: size.width * 0.08,
                top: size.height * 0.25,
                child: Container(
                  width: size.width * 0.85,
                  height: size.height * 0.38,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 2,
                            color: Colors.black.withOpacity(0.4))
                      ],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Container(
                          width: size.width,
                          height: size.height * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(imgSelected)),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          description,
                          style: const TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Text("")
            ],
          );
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      },)
    );
  }

  Widget tabs(Size size,snapshot) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.89,
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: Column(
              children: [
                const TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: "Photo",
                    ),
                    Tab(
                      text: "Videos",
                    ),
                    Tab(
                      text: "Info",
                    )
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      photo(size,snapshot),
                      video(size,snapshot),
                      info(size,snapshot),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget info(Size size,AsyncSnapshot snapshot) {
    return SizedBox(
      width: size.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
            const  SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Correo: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: GlobalColor.textInforGeneralColor),
                  ),
                  Text(
                    snapshot.data["email"],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: GlobalColor.textInforGeneralColor),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Telefono: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: GlobalColor.textInforGeneralColor),
                  ),
                  Text("9713803554",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: GlobalColor.textInforGeneralColor))
                ],
              ),
             const  SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ranking: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: GlobalColor.textInforGeneralColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 40,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 40,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 40,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 40,
                      ),
                      Icon(
                        Icons.star,
                        size: 40,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Generos: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: GlobalColor.textInforGeneralColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: GlobalColor.backgroundColorRadio,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Rock",
                          style: TextStyle(
                              color: GlobalColor.radioInfoGenere,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: GlobalColor.backgroundColorRadio,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Indie",
                          style: TextStyle(
                              color: GlobalColor.radioInfoGenere,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: GlobalColor.backgroundColorRadio,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Metal",
                          style: TextStyle(
                              color: GlobalColor.radioInfoGenere,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Comentarios",
                        style: TextStyle(
                            color: GlobalColor.textInforGeneralColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Bryan elian",
                                      style: TextStyle(
                                          color:
                                              GlobalColor.textInforGeneralColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [Text("4.4"), Icon(Icons.star)],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "El mejor grupo que es escuchado lo recomiendo",
                            style: TextStyle(
                                color: GlobalColor.textInforGeneralColor,
                                fontSize: 18),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Kevin Omar",
                                      style: TextStyle(
                                          color:
                                              GlobalColor.textInforGeneralColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [Text("3.4"), Icon(Icons.star)],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "El mejor grupo que es escuchado lo recomiendo",
                            style: TextStyle(
                                color: GlobalColor.textInforGeneralColor,
                                fontSize: 18),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget video(Size size,AsyncSnapshot snapshot) {
    return SizedBox(
      width: size.width,
      child:FutureBuilder(
        future: ApiServices().getImgUser(snapshot.data["id"]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  GridView.builder(
        shrinkWrap: true,
        controller: _scrollControllerGrid,
        physics: activeGridScroll
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return  GestureDetector(
            onLongPress: () {
              print("precionado: " + index.toString());
                setState(() {
                  viewImageFullScreen = true;
                  imgSelected = snapshot.data!["data"][index]["link_contenido"];
                  description = snapshot.data!["data"][index]["descripcion"];
                });
            },
            onLongPressCancel: () {
                setState(() {
                  viewImageFullScreen = false;
                });
            },
            onLongPressEnd: (details) {
                setState(() {
                  viewImageFullScreen = false;
                });
              },
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Card(
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                      fit: BoxFit.cover, image: NetworkImage(snapshot.data!["data"][index]["link_contenido"])),
                ),
              ),
            ),
          );
        },
      );
          }else{
            return const CircularProgressIndicator();
          }
        },
      )
    );
  }

  Widget photo(Size size,AsyncSnapshot snapshot) {
    return SizedBox(
      width: size.width,
      child:FutureBuilder(
        future: ApiServices().getImgUser(snapshot.data["id"]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  GridView.builder(
        shrinkWrap: true,
        controller: _scrollControllerGrid,
        physics: activeGridScroll
            ? const AlwaysScrollableScrollPhysics()
            : NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
        ),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          
          return GestureDetector(
            onLongPress: () {
              print("precionado: " + index.toString());
                setState(() {
                  viewImageFullScreen = true;
                  imgSelected = snapshot.data!["data"][index]["link_contenido"];
                  description = snapshot.data!["data"][index]["descripcion"];
                });
            },
            onLongPressCancel: () {
                setState(() {
                  viewImageFullScreen = false;
                });
            },
            onLongPressEnd: (details) {
                setState(() {
                  viewImageFullScreen = false;
                });
              },
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Card(
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                      fit: BoxFit.cover, image: NetworkImage(snapshot.data!["data"][index]["link_contenido"])),
                ),
              ),
            ),
          );
        },
      );
          }else{
            return const Center(child: const CircularProgressIndicator());
          }
        },
      )
    );
  }
}
