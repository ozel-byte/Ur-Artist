import 'package:flutter/material.dart';

class Browserhuerfano extends StatefulWidget {
  const Browserhuerfano({super.key});

  @override
  State<Browserhuerfano> createState() => _BrowserhuerfanoState();
}

class _BrowserhuerfanoState extends State<Browserhuerfano> {
  
  TransformationController _transformationController = TransformationController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _transformationController.value.setTranslationRaw(-3190.3, -459, 1);
    _transformationController.addListener(() { 
      print(_transformationController.value.dimension);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(double.infinity),
          constrained: false,
          minScale: 0.1,
          transformationController: _transformationController,
          maxScale: 1.6,
          onInteractionStart: (details) {
            print(details);
          },
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.pexels.com/photos/9977458/pexels-photo-9977458.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.pexels.com/photos/5524739/pexels-photo-5524739.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.pexels.com/photos/3013980/pexels-photo-3013980.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.pexels.com/photos/11010062/pexels-photo-11010062.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/5732637/pexels-photo-5732637.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/5732637/pexels-photo-5732637.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/5732637/pexels-photo-5732637.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                ],
              ),
              Row(
                children: [
                  Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                ],
              ),
              Row(
                children: [
                  Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10909379/pexels-photo-10909379.jpeg"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10909379/pexels-photo-10909379.jpeg"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10909379/pexels-photo-10909379.jpeg"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10909379/pexels-photo-10909379.jpeg"))
                          ),
                        ),
                      ),
                ],
              ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.pexels.com/photos/9977458/pexels-photo-9977458.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.pexels.com/photos/5524739/pexels-photo-5524739.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.pexels.com/photos/3013980/pexels-photo-3013980.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.pexels.com/photos/11010062/pexels-photo-11010062.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/5732637/pexels-photo-5732637.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/5732637/pexels-photo-5732637.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/5732637/pexels-photo-5732637.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                ],
              ),
              Row(
                children: [
                  Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                ],
              ),
              Row(
                children: [
                  Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.pexels.com/photos/9977458/pexels-photo-9977458.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.pexels.com/photos/5524739/pexels-photo-5524739.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.pexels.com/photos/3013980/pexels-photo-3013980.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.pexels.com/photos/11010062/pexels-photo-11010062.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/5732637/pexels-photo-5732637.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/5732637/pexels-photo-5732637.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/5732637/pexels-photo-5732637.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                ],
              ),
              Row(
                children: [
                  Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                ],
              ),
              Row(
                children: [
                  Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10909379/pexels-photo-10909379.jpeg"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10909379/pexels-photo-10909379.jpeg"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10909379/pexels-photo-10909379.jpeg"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10909379/pexels-photo-10909379.jpeg"))
                          ),
                        ),
                      ),
                ],
              ),
                  Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10909379/pexels-photo-10909379.jpeg"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10909379/pexels-photo-10909379.jpeg"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10909379/pexels-photo-10909379.jpeg"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10909379/pexels-photo-10909379.jpeg"))
                          ),
                        ),
                      ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.pexels.com/photos/9977458/pexels-photo-9977458.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.pexels.com/photos/5524739/pexels-photo-5524739.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.pexels.com/photos/3013980/pexels-photo-3013980.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://images.pexels.com/photos/11010062/pexels-photo-11010062.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/5732637/pexels-photo-5732637.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/5732637/pexels-photo-5732637.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/5732637/pexels-photo-5732637.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                ],
              ),
              Row(
                children: [
                  Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10066931/pexels-photo-10066931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                          ),
                        ),
                      ),
                ],
              ),
              Row(
                children: [
                  Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10909379/pexels-photo-10909379.jpeg"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10909379/pexels-photo-10909379.jpeg"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10909379/pexels-photo-10909379.jpeg"))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://images.pexels.com/photos/10909379/pexels-photo-10909379.jpeg"))
                          ),
                        ),
                      ),
                ],
              ),
            
            ],
          )),
    );
  }
}
