import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:urartist/utils/global_colors.dart';

class Buscador extends StatefulWidget {
  const Buscador({super.key});

  @override
  State<Buscador> createState() => _BuscadorState();
}

class _BuscadorState extends State<Buscador> {

  TextEditingController _textEditingController = TextEditingController();

  bool typing = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back,color: Colors.grey,)),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title:  TextField(
            controller: _textEditingController,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "buscar",
              border: InputBorder.none,
             
              contentPadding: EdgeInsets.only(top: 3)
            ),
          ),
          actions:  [
            IconButton(onPressed: (){
              _textEditingController.text = "";
            }, icon: Icon(Icons.close,color: Colors.grey,)),
            SizedBox(width: 10,)
          ],
        ),
        body: Column(
          children:  [
            TabBar(
              labelColor: GlobalColor.primary,
              isScrollable: true,
              unselectedLabelColor: Colors.black.withOpacity(0.6),
              tabs: const[
                Tab(text: "Artist",),
                Tab(text: "Cumbia",),
                Tab(text: "Rock",),
                Tab(text: "Sala",),
                Tab(text: "Indie",)
    
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  artist(),
                  Icon(Icons.queue_music),
                  Icon(Icons.music_note_outlined),
                  Icon(Icons.queue_music),
                  Icon(Icons.queue_music)

                ],
              ),
            )
            
            
          ],
        ),
      ),
    );
  }

  artist(){
  return  ListView(
    padding: EdgeInsets.only(top: 10),
      children:  [
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, "profile-artist",arguments: "view-cliente");
          },
          child: const ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://images.pexels.com/photos/7502182/pexels-photo-7502182.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
            ),
            title: Text("Mala Racha"),
            subtitle: Text("Rock - Indie"),
          ),
        ),
       const ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://images.pexels.com/photos/7502182/pexels-photo-7502182.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
          ),
          title: Text("The killers"),
          subtitle: Text("Rock - Indie"),
        ),
       const ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://images.pexels.com/photos/7502182/pexels-photo-7502182.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
          ),
          title: Text("Junior Klan"),
          subtitle: Text("Rock - Indie"),
        ),
      const  ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://images.pexels.com/photos/8649332/pexels-photo-8649332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
          ),
          title: Text("Impacto musical saki"),
          subtitle: Text("Rock - Indie"),
        )
      ],
    );
  }

}