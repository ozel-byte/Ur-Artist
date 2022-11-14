import 'package:flutter/material.dart';
import 'package:urartist/utils/global_colors.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String nombre = "ozel";
  String password = "1234";

  String nombreArtista = "Mala racha";
  String passwordArtista = "1234";

  String nombreHuefano = "nelson";
  String passwordHuerfano = "1234";

  TextEditingController _textEditingControllerNombre = TextEditingController();
  TextEditingController _textEditingControllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body:ListView(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()
        ),
        shrinkWrap: true,
        children: [
           Padding(
        padding:  EdgeInsets.only(top: size.height*0.25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
          const  Text("Ur artist",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: GlobalColor.primary),),
           const Text("Iniciar sesion"),
           SizedBox(height: 30,),
      
           Padding(
             padding:  EdgeInsets.symmetric(horizontal: size.width*0.1),
             child:  TextField(
              controller: _textEditingControllerNombre,
                decoration: const InputDecoration(
                  hintText: "Nombre"
                ),
              ),
           ),
           SizedBox(height: 30,),
           Padding(
             padding:  EdgeInsets.symmetric(horizontal: size.width*0.1),
             child:  TextField(
              controller: _textEditingControllerPassword,
                decoration: const InputDecoration(
                  hintText: "Contraseña"
                ),
              ),
           ),
          const SizedBox(height: 30,),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:const [
                Text("¿Olvido su contraseña?"),
                SizedBox(width: 40,)
              ],
            ),
          const SizedBox(height: 30,),
      
            GestureDetector(
              onTap: () {
                login();
              },
              child: Container(
                width: size.width*0.8,
                height: size.height*0.07,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Center(child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 20),)),
              ),
            ),
           const SizedBox(height: 30,),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
               const Text("¿Añadir Nuevo Usuario? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "signUp");
                  },
                  child: const Text("Crear Cuenta",style: TextStyle(fontWeight: FontWeight.bold),))
              ],
            ),
      
          ],
        ),
      ),
        ],
      )
    );
  }

  login(){
    if (_textEditingControllerNombre.text == nombre && _textEditingControllerPassword.text == password) {
      if (nombre=="ozel") {
      Navigator.pushNamed(context, "home");
      }else if(nombreArtista=="Mala racha"){
      Navigator.pushNamed(context, "home-artist");
      }else{
      Navigator.pushNamed(context, "home-huerfano");
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error de credenciales")));
    }
  }
}