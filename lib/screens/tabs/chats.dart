import 'package:clone_whatsapp/entity/contactItem.dart';
import 'package:clone_whatsapp/entity/routes.dart';
import 'package:clone_whatsapp/screens/chatRoom.dart';
import 'package:flutter/material.dart';

class TabChats extends StatefulWidget {
  @override
  _TabChatsState createState() => _TabChatsState();
}

class _TabChatsState extends State<TabChats> {
  List<ContactItem> _contactItens = [
    ContactItem(
      'assets/perfil1.jpg',
      'Camila',
      'Vou te ajudar',
      null
    ),
    ContactItem(
      'assets/perfil2.jpg',
      'Giulia',
      'A testar',
      Icons.camera_alt
    ),
    ContactItem(
      'assets/perfil3.jpg',
      'Suelen',
      'Esse seu novo',
      Icons.mic
    ),
    ContactItem(
      'assets/perfil4.jpg',
      'Vitoria',
      'App clone do whats',
      Icons.done_all
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context,index)=>Padding(
        padding: const EdgeInsets.only(left: 95),
        child: Divider(color: Colors.black12,),
      ),
      itemCount: _contactItens.length,
      itemBuilder: (context,index){
        ContactItem chats = _contactItens[index];

        return Container(height: 65,
          child: ListTile(
            contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            leading: CircleAvatar(
              backgroundImage: AssetImage(chats.picture),
              maxRadius: 30,
            ),
            title: Text(chats.name,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
            ),
            subtitle: Row(
              children: <Widget>[
                Icon(chats.iconSubtitle,size: 15,color: Colors.black45,),
                Text(chats.subtitle,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            trailing: Text(DateTime.now().hour.toString()+':'+DateTime.now().minute.toString(),
              style: TextStyle(color: Colors.black54,fontSize: 11),
            ),
            onTap:(){
              Navigator.pushNamed(context, Routes.chatRom, arguments: chats);
            } ,
          ),
        );
      },
    );
  }
}