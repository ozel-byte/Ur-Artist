import 'package:flutter/material.dart';
import 'package:urartist/utils/global_colors.dart';
import 'package:animate_do/animate_do.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 5000)).then((value) => Navigator.pushNamed(context, "login"));
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: GlobalColor.primary,
       body: Stack(
         children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Bounce(child: Icon(Icons.mic_none_rounded,size: 50,color: Colors.white,)),
                FadeIn(child: Text("Ur Artist",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),))
              ],
         ),
            ],
          ),
         Positioned(
            top: size.height*0.38,
            left: size.width*0.22,
            child: ZoomIn(
              controller: (p0) {
                
                p0.addListener(() { 
                  if (p0.isCompleted) {
                p0.repeat();
                  }
                  
                });
              },
              duration: Duration(milliseconds: 3000),
              
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2)
                  ),
                  borderRadius: BorderRadius.circular(200)
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height*0.32,
            left: size.width*0.08,
            child: ZoomIn(
              controller: (p0) {
                
                p0.addListener(() { 
                  if (p0.isCompleted) {
                p0.repeat();
                  }
                  
                });
              },
              duration: Duration(milliseconds: 4500),
              
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2)
                  ),
                  borderRadius: BorderRadius.circular(200)
                ),
              ),
            ),
          ),
         ],
       ),
    );
  }
}