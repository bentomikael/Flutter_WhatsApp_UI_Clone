import 'package:clone_whatsapp/entity/firebaseControl.dart';
import 'package:clone_whatsapp/screens/home.dart';
import 'package:clone_whatsapp/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:clone_whatsapp/entity/routes.dart' as route;

void main() async{
    var _user = await FirebaseControl.verifyLoggedUser();
    var _startScreen;

    if(_user){
      _startScreen = Home();
    }else{
      _startScreen = Login();
    }

   runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Color(0xff075E54), 
      accentColor: Color(0xff25D366)
    ),
    onGenerateRoute: route.generateRoute,
    home: _startScreen,
  ));
}
