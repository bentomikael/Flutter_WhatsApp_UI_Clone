import 'package:flutter/material.dart';
import 'dart:io';
import 'package:clone_whatsapp/entity/firebaseControl.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  File _image;
  
  @override
  Widget build(BuildContext context) {
    
    _editImage(String changeType) async{
      File selectedImage;
      switch (changeType) {
        case 'cam':
          //selectedImage = await ImagePicker.pickImage(source: ImageSource.camera);
          break;
        case 'gallery':
          //selectedImage = await ImagePicker.pickImage(source: ImageSource.gallery);
          break;
        setState(() {
          _image = selectedImage;
          if(_image != null){
            FirebaseControl.savePicture(_image);
          }
        });
      }
    }
    _bottoSheet(BuildContext context){
      showModalBottomSheet(context: context,builder: (context){
        return Container(
          height: 250,
          color: Colors.black87,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 50,bottom: 30),
                      child: Text('Profile picture',
                        style: TextStyle(color: Colors.white,fontSize: 20),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                      height: 65,
                      width: 65,
                      child: RaisedButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Image(image: AssetImage('assets/gallery.png')),
                        onPressed: (){},
                      ),
                    ),
                    Text('Gallery',
                        style: TextStyle(color: Colors.white)),]),
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 35,right: 30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                              height: 65,
                              width: 65,
                              child: RaisedButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                child: Image(image: AssetImage('assets/cam.png')),
                                onPressed: (){},
                              ),
                            ),
                            Text('Cam',
                          style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 65,
                          width: 65,
                          child: RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Image(image: AssetImage('assets/trash.png')),
                            onPressed: (){},
                          ),
                        ),
                        Text('Remove picture',
                        style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
                Divider(color: Colors.white,height: 5,),
                Row(
                  children: <Widget>[
                    FlatButton(
                      child: Text('Cancel',
                        style: TextStyle(color: Colors.white,fontSize: 15),
                      ),
                      onPressed: (){},
                    )
                  ],
                )
                ],
              ),   
            ],
          ),
        );
      });  
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true, 
            floating: false,
            expandedHeight: 360,
            actions: <Widget>[
              IconButton(
                icon:Icon(Icons.create),
                onPressed: () => _bottoSheet(context)
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Mikael Bento'),
              background: Image.asset('assets/perfil.jpeg',fit: BoxFit.cover,),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: <Widget>[
  //card 1                    
                Card(
                  elevation: 1,
                  child: Container(
                    height: 70,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('+55 48 9119-0000 \n Conta comercial'),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(height: 10,color: Colors.transparent),
  //card 2
                Card(
                  elevation: 1,
                  child: Container(
                    height: 100,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.local_offer,color: Colors.black38),
                              Text('Serviços Profissionais')
                            ],
                          ),
                        ),
                        Divider(height: 20,color: Colors.transparent),
                        Padding(
                          padding: const EdgeInsets.all(5),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.access_time,color: Colors.black38),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 45),
                                  child: Text('Domingo'),
                                ),
                                Text('Fechado'),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Divider(height: 10,color: Colors.transparent),
  //card 3                    
                Card(
                  elevation: 1,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text('About',style: TextStyle(color: Colors.black26),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text('Flutter Developer'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}