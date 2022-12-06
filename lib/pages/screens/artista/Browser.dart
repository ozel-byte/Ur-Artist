import 'package:flutter/material.dart';



class Browser extends StatelessWidget {
  const Browser({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.green,

    );
  }
}