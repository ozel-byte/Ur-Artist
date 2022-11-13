import 'package:flutter/material.dart';

class Presentation extends StatefulWidget {
  const Presentation({Key? key}) : super(key: key);

  @override
  State<Presentation> createState() => _PresentationState();
}

class _PresentationState extends State<Presentation>
    with TickerProviderStateMixin {
  int index = 0;
  String textButton = "Siguiente";
  PageController _controllerPageView = PageController();
  double scaleButtonSignIn = 1.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            buttonSkip(size),
            logo(),
            sliderImg(size),
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
      children: const [
        Text("No tienes una cuenta? "),
        Text(
          "Sign Up",
          style:
              TextStyle(color: Color(0xff125BE4), fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  buttonSignIn(Size size, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          scaleButtonSignIn = 0.95;
        });

        index++;
        if (index == 3) {
          Navigator.pushNamed(context, "login");
        }
        _controllerPageView.animateToPage(index,
            duration: const Duration(milliseconds: 1200), curve: Curves.ease);
        if (index == 2) {
          textButton = "Inicio";
        }
        await Future.delayed(Duration(milliseconds: 400)).then((value) => {});
        setState(() {
          scaleButtonSignIn = 1.0;
        });
      },
      child: Transform.scale(
        scale: scaleButtonSignIn,
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.07,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xff2F82FF), Color(0xff1EB2F1)]),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            textButton,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          )),
        ),
      ),
    );
  }

  Row lineSliderImg() {
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
                color: index == 0
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
                color: index == 1
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
                color: index == 2
                    ? const Color(0xff1976D3)
                    : const Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ],
    );
  }

  Container sliderImg(Size size) {
    return Container(
        width: size.width,
        height: size.height * 0.6,
        child: PageView(
          controller: _controllerPageView,
          onPageChanged: (value) {
            setState(() {
              index = value;
            });
            if (value == 2) {
              textButton = "Inicio";
            } else {
              textButton = "Siguiente";
            }
          },
          children: [
            Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.4,
                  child: const Image(
                      fit: BoxFit.cover, image: AssetImage("assets/img1.gif")),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Encuentra un Artista para tu fiesta ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "contactalos desde un solo click sin salir de casa",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.4,
                  child: Image(
                      fit: BoxFit.cover, image: AssetImage("assets/img2.png")),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Promocionate a ti o a tu banda",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
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
                Container(
                  width: size.width,
                  height: size.height * 0.4,
                  child: const Image(
                      fit: BoxFit.cover, image: AssetImage("assets/img3.png")),
                ),
                Container(
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
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
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

  Row buttonSkip(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {});
            index = 2;
            _controllerPageView.animateToPage(index,
                duration: const Duration(milliseconds: 1200),
                curve: Curves.ease);
            textButton = "Inicio";
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
