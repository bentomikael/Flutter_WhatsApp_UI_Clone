
import 'package:flutter/material.dart';

class ContactItem{
  String _picture;
  String _name;
  String _subtitle;
  IconData _iconSubtitle;

  ContactItem(this._picture,this._name,this._subtitle,this._iconSubtitle);

  //getters
  String get name => _name;
  String get picture => _picture;
  String get subtitle => _subtitle;
  IconData get iconSubtitle => _iconSubtitle;

  //setters
  set name(String name){
    _name = name;
  }
  set picture(String path){
    _picture = path;
  }
  set subtitle(String subtitle){
    _subtitle = subtitle;
  }
  set iconSubtitle(IconData iconSubtitle){
    _iconSubtitle = iconSubtitle;
  }
  
}