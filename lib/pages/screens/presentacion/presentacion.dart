import 'package:flutter/material.dart';
import 'package:urartist/controller/streams/presentacionstream.dart';

import '../../../utils/global_colors.dart';

class Presentation extends StatefulWidget {
  const Presentation({Key? key}) : super(key: key);

  @override
  State<Presentation> createState() => _PresentationState();
}

class _PresentationState extends State<Presentation>
    with TickerProviderStateMixin {
  int index = 0;
  String textButton = "Siguiente";
  final PageController _controllerPageView = PageController();
  double scaleButtonSignIn = 1.0;
  PresentacionStream presentacionstream = PresentacionStream();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print("se dibuja");
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            buttonSkip(size),
            logo(),
            SliderImg(
                controllerPageview: _controllerPageView,
                index: index,
                textButton: textButton,
                streamController: presentacionstream),
            const SizedBox(
              height: 30,
            ),
            lineSliderImg(),
            const SizedBox(
              height: 40,
            ),
            buttonSignIn(size, context),
            const SizedBox(
              height: 20,
            ),
            index == 2 ? buttonSignUp() : Container()
          ],
        ),
      ),
    );
  }

  Text logo() {
    return const Text(
      "Ur Artist",
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Color(0xff1976D3), fontSize: 30),
    );
  }

  Row buttonSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("No tienes una cuenta? "),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "signUp");
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
                color: Color(0xff125BE4), fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  buttonSignIn(Size size, BuildContext context) {
    return GestureDetector(
        onTap: () async {
          presentacionstream.streamIndex =
              _controllerPageView.page!.toInt() + 1;
          _controllerPageView.animateToPage(
              _controllerPageView.page!.toInt() + 1,
              duration: const Duration(milliseconds: 700),
              curve: Curves.linear);

          setState(() {
            scaleButtonSignIn = 0.95;
          });
          await Future.delayed(const Duration(milliseconds: 400))
              .then((value) => {
               
              });
          setState(() {
            scaleButtonSignIn = 1.0;
          });
          if (_controllerPageView.page == 2.0) {
             if (mounted) {
               Navigator.pushNamed(context, "login");
             }
          }
        },
        child: StreamBuilder(
          stream: presentacionstream.getStream,
          initialData: 0,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              String textButtonPresentation = snapshot.data == 0
                  ? "Siguiente"
                  : snapshot.data == 1
                      ? "Siguiente"
                      : "Iniciar";
              return Transform.scale(
                scale: scaleButtonSignIn,
                child: Container(
                  width: size.width * 0.8,
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                          color: GlobalColor.primary,
                          borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    textButtonPresentation,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ));
  }

  Widget lineSliderImg() {
    return StreamBuilder(
      initialData: 0,
      stream: presentacionstream.getStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    textButton = "Siguiente";
                    _controllerPageView.animateToPage(0,
                        duration: const Duration(milliseconds: 1200),
                        curve: Curves.ease);
                  });
                },
                child: Container(
                  width: 40,
                  height: 10,
                  decoration: BoxDecoration(
                      color: snapshot.data == 0
                          ? const Color(0xff1976D3)
                          : const Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    textButton = "Siguiente";
                    _controllerPageView.animateToPage(1,
                        duration: const Duration(milliseconds: 1200),
                        curve: Curves.ease);
                  });
                },
                child: Container(
                  width: 40,
                  height: 10,
                  decoration: BoxDecoration(
                      color: snapshot.data == 1
                          ? const Color(0xff1976D3)
                          : const Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _controllerPageView.animateToPage(2,
                        duration: const Duration(milliseconds: 1200),
                        curve: Curves.ease);
                  });
                },
                child: Container(
                  width: 40,
                  height: 10,
                  decoration: BoxDecoration(
                      color: snapshot.data == 2
                          ? const Color(0xff1976D3)
                          : const Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Row buttonSkip(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            presentacionstream.streamIndex = 2;
            _controllerPageView.animateToPage(2,
                duration: const Duration(milliseconds: 700),
                curve: Curves.linear);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: size.width * 0.15,
              height: size.height * 0.04,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                "Skip",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ),
      ],
    );
  }
}

class SliderImg extends StatefulWidget {
  final PageController? controllerPageview;
  String? textButton;
  PresentacionStream? streamController;

  int? index;
  SliderImg(
      {super.key,
      this.controllerPageview,
      this.textButton,
      this.index,
      this.streamController});

  @override
  State<SliderImg> createState() => _SliderImgState();
}

class _SliderImgState extends State<SliderImg> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        height: size.height * 0.6,
        child: PageView(
          controller: widget.controllerPageview,
          onPageChanged: (value) {
            widget.streamController!.streamIndex = value;
            setState(() {
              widget.index = value;
            });
            if (value == 2) {
              widget.textButton = "Inicio";
            } else {
              widget.textButton = "Siguiente";
            }
          },
          children: [
            Column(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * 0.4,
                  child: const Image(
                      fit: BoxFit.cover, image: AssetImage("assets/img1.gif")),
                ),
                SizedBox(
                  width: size.width,
                  height: size.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Encuentra un Artista para tu fiesta ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "contactalos desde un solo click sin salir de casa",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * 0.4,
                  child: const Image(
                      fit: BoxFit.cover, image: AssetImage("assets/img2.gif")),
                ),
                SizedBox(
                  width: size.width,
                  height: size.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Promocionate a ti o a tu banda",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          " para que otras personas conoscan tu trabajo y te contacten",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * 0.4,
                  child: const Image(
                      fit: BoxFit.cover, image: AssetImage("assets/img4.gif")),
                ),
                SizedBox(
                  width: size.width,
                  height: size.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          "Presentaciones de los artistas",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "Ademas puedes escuchar sus musicas y ver sus presentaciones que suben para tener una idea del artista",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
