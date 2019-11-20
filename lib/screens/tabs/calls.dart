import 'package:clone_whatsapp/entity/contactItem.dart';
import 'package:flutter/material.dart';

class TabCalls extends StatefulWidget {
  @override
  _TabCallsState createState() => _TabCallsState();
}

class _TabCallsState extends State<TabCalls> {

  List<ContactItem> _calls = [
    ContactItem(
      'assets/perfil1.jpg',
      'Camila',
      'Ontem 20:15',
      Icons.call_received,
    ),
    ContactItem(
      'assets/perfil2.jpg',
      'Giulia',
      '20 de outubro 15:23',
      Icons.call_made,
    ),
    ContactItem(
      'assets/perfil3.jpg',
      'Suelen',
      '15 de setembro 10:11',
      Icons.call_received,
    ),
    ContactItem(
      'assets/perfil4.jpg',
      'Vitoria',
      '9 de setembro 22:34',
      Icons.call_made,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context,index)=>Padding(
        padding: const EdgeInsets.only(left: 95),
        child: Divider(color: Colors.black12,),
      ),
      itemCount: _calls.length,
      itemBuilder: (context,index){
        ContactItem call = _calls[index];

        return ListTile(
          contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          leading: CircleAvatar(
            backgroundImage: AssetImage(call.picture),
            maxRadius: 30,
          ),
          title: Text(call.name,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
          ),
          subtitle: Row(children: <Widget>[
            Icon(call.iconSubtitle,size: 15,color: Colors.green,),
            Text(call.subtitle,
              style: TextStyle(fontSize: 12),
            ),
          ]),
          trailing: Icon(Icons.phone), 
          onTap:(){} ,
        );
      },
    );
  }
}