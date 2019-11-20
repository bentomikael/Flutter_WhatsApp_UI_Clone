import 'package:clone_whatsapp/entity/contactItem.dart';
import 'package:flutter/material.dart';

class MyContacts extends StatefulWidget {
  @override
  _MyContactsState createState() => _MyContactsState();
}

class _MyContactsState extends State<MyContacts> {
  List<ContactItem> _contacts = [
    ContactItem(
      'https://firebasestorage.googleapis.com/v0/b/clonewhats-afb97.appspot.com/o/perfil1.jpg?alt=media&token=430188c9-f67e-4974-a4b6-290d975d377a',
      'Camila',
      'Disponivel',
      null
    ),
    ContactItem(
      'https://firebasestorage.googleapis.com/v0/b/clonewhats-afb97.appspot.com/o/perfil2.jpg?alt=media&token=f126195e-9109-432b-80ae-93f28cde12a7',
      'Giulia',
      'Disponivel',
      null
    ),
    ContactItem(
      'https://firebasestorage.googleapis.com/v0/b/clonewhats-afb97.appspot.com/o/perfil3.jpg?alt=media&token=8584247e-24e5-4e7b-a524-29d44c6c2972',
      'Suelen',
      'Disponivel',
      null
    ),
    ContactItem(
      'https://firebasestorage.googleapis.com/v0/b/clonewhats-afb97.appspot.com/o/perfil4.jpg?alt=media&token=9465b0b2-bb2e-462d-a1b2-00d989cf7ac6',
      'Vitoria',
      'Disponivel',
      null
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
//app bar      
      appBar: AppBar(brightness: Brightness.dark,
        title: ListTile(title: Text('MyContacts',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 19)),
        subtitle: Text(_contacts.length.toString()+" contacts",style: TextStyle(color: Colors.white),),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: (){},
          ),
        ],
      ),
//Contacts list
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context,index){
          ContactItem contact = _contacts[index];

          return ListTile(
            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(contact.picture),
            ),
            title: Text(contact.name,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),
            ),
            subtitle: Text(contact.subtitle,
              style: TextStyle(fontSize: 12,),
            ),
            onTap:(){} ,
          );
        },
      ),
    );
  }
}