import 'package:flutter/material.dart';

class TabStatus extends StatefulWidget {
  @override
  _TabStatusState createState() => _TabStatusState();
}

class _TabStatusState extends State<TabStatus> {
  @override
  Widget build(BuildContext context) {
    
    return ListTile(
      leading: Stack(
        children: <Widget>[
          CircleAvatar(backgroundImage: AssetImage('assets/perfil.jpeg'),
            maxRadius: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 35,top: 35),
            child: Stack(
              children: <Widget>[
                Icon(Icons.add_circle,color: Colors.green,),
                Icon(Icons.add,color: Colors.white,),
              ],
            ),
          ),
        ],
      ),
      title: Text('Meu Status',style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text('Toque para atualizar seu status'),
    );
  }
}