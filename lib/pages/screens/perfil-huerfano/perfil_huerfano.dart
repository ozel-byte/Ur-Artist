import 'package:flutter/material.dart';

import '../../../utils/global_colors.dart';

class PerfilHuerfano extends StatefulWidget {
  const PerfilHuerfano({super.key});

  @override
  State<PerfilHuerfano> createState() => PerfilHuerfanoState();
}

class PerfilHuerfanoState extends State<PerfilHuerfano> {
  ScrollController _scrollController = ScrollController();
  ScrollController _scrollControllerGrid = ScrollController();
  bool activeTextAppBar = false;
  bool activePhotoAppBar = false;
  bool activeGridScroll = false;
  bool viewImageFullScreen = false;
  String imgSelected = "";
  List<String> images = [
    "https://images.pexels.com/photos/1587927/pexels-photo-1587927.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/1916821/pexels-photo-1916821.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/1327426/pexels-photo-1327426.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/442540/pexels-photo-442540.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/1427368/pexels-photo-1427368.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/1652361/pexels-photo-1652361.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/213207/pexels-photo-213207.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/2601215/pexels-photo-2601215.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    ""
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollControllerGrid.addListener(() {
      if (activePhotoAppBar) {
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
            duration: Duration(seconds: 2), curve: Curves.ease);
            activeGridScroll = true;
      }
      if (_scrollController.position.pixels > 130) {
        setState(() {
          activeTextAppBar = true;
        });
      }

      if (_scrollController.position.pixels > 200) {
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
      body:  Stack(
        children: [
          
          CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
              title: activeTextAppBar
                  ? const Text(
                      "Ozel Lopez",
                      style: TextStyle(color: Colors.black),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Huerfano"), Icon(Icons.verified)],
                    ),
              backgroundColor: Colors.white,
              expandedHeight: 320,
              centerTitle: true,
              actions: [
                activePhotoAppBar
                    ? const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage("assets/profile.jpg"),
                        ),
                      )
                    : Container()
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: size.width,
                          height: size.height*0.25,
                          child: const Image(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/237464/pexels-photo-237464.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")),
                        ),
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 0.2,
                                    left: size.width * 0.05),
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      image:const DecorationImage(
                                        fit: BoxFit.cover,
                                          image:
                                              NetworkImage("https://images.pexels.com/photos/363905/pexels-photo-363905.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")),
                                      border: Border.all(color: Colors.blue,width: 3)),
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
                        children: const [
                          Text(
                            "Ozel Lopez",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                              "Soy baterista y estoy en busca de una banda para poder tocar",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16))
                        ],
                      ),
                    )
                  ],
                ),
              )),
          SliverList(delegate: SliverChildListDelegate([tabs(size)]))
        ],
      ),
       viewImageFullScreen ? Positioned(
          left: size.width*0.12,
          top: size.height*0.32,
          child: Container(
              width: size.width*0.75,
              height: size.height*0.35,
              decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 2,
                  color: Colors.black.withOpacity(0.4)
                )
              ],
              borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: size.height*0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(imgSelected)),
                    )),
                  Text("descripcion de la imagen",style: TextStyle(fontSize: 18),)
                ],
              ),
            ),
        ): Text("")
        ],
      )
    );
  }

  Widget tabs(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.89,
      color: Colors.white,
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.white,
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
                      photo(size),
                      video(size),
                      info(size),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  Container info(Size size) {
    return Container(
      width: size.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
             const SizedBox(
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
                    "Ozel2@gmail.com",
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
                  Text("9713123554",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: GlobalColor.textInforGeneralColor))
                ],
              ),
             
              
              Column(
                children: [
                const  SizedBox(
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
                const  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                             const CircleAvatar(
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
                         const SizedBox(
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
                    const  SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                            const  CircleAvatar(
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
                         const SizedBox(
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

  Container video(Size size) {
    return Container(
      width: size.width,
      child: GridView.builder(
        shrinkWrap: true,
        controller: _scrollControllerGrid,
        physics: activeGridScroll
            ? const AlwaysScrollableScrollPhysics()
            : NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:
                  Image(fit: BoxFit.cover, image: NetworkImage(images[index])),
            ),
          );
        },
      ),
    );
  }

  Widget photo(Size size) {
    return SizedBox(
      width: size.width,
      child: GridView.builder(
        shrinkWrap: true,
        controller: _scrollControllerGrid,
        physics: activeGridScroll
            ? const AlwaysScrollableScrollPhysics()
            : NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () {
              print("precionado: "+index.toString());
              setState(() {
              viewImageFullScreen = true;
              imgSelected = images[index];
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
                color: Colors.amber[100],
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                      fit: BoxFit.cover, image: NetworkImage(images[index])),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
