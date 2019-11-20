
import 'package:clone_whatsapp/screens/chatRoom.dart';
import 'package:clone_whatsapp/screens/register.dart';
import 'package:clone_whatsapp/screens/home.dart';
import 'package:clone_whatsapp/screens/login.dart';
import 'package:clone_whatsapp/screens/settings.dart';
import 'package:flutter/material.dart';

class Routes{
  static const String home = 'Home';
  static const String login = 'Login';
  static const String register = 'Register';
  static const String settings = 'Settings';
  static const String chatRom = 'ChatRoom';
}

Route<dynamic> generateRoute(RouteSettings route){
    var _args = route.arguments;

    switch (route.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_)=> Home());
        break;
      case Routes.login:
        return MaterialPageRoute(builder: (_)=> Login());
        break;
      case Routes.register:
        return MaterialPageRoute(builder: (_)=> Register());
        break;
      case Routes.settings:
        return MaterialPageRoute(builder: (_)=> Settings());
        break;
      case Routes.chatRom:
        return MaterialPageRoute(builder: (_)=> ChatRoom(_args));
        break;
  }
}

