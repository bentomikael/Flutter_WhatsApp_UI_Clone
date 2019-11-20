import 'package:clone_whatsapp/entity/firebaseControl.dart';
import 'package:clone_whatsapp/entity/routes.dart';
import 'package:clone_whatsapp/entity/search.dart';
import 'package:clone_whatsapp/screens/myContacts.dart';
import 'package:clone_whatsapp/screens/tabs/calls.dart';
import 'package:clone_whatsapp/screens/tabs/chats.dart';
import 'package:clone_whatsapp/screens/tabs/status.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
    TabController _tabController;
    List<String> _popupMenuList = [
      'Settings',
      'Logout'];
    List<Widget> _tabList = [
      Tab(text: 'chats'),
      Tab(text: 'status'),
      Tab(text: 'calls')
      ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

//menu selection action
    _selectedItem(String item){
      switch (item) {
        case 'Settings':
        Navigator.pushNamed(context, Routes.settings);
          break;
        case 'Logout':
          FirebaseControl.logout();
          Navigator.pushNamedAndRemoveUntil(context,Routes.login,(Route<dynamic> route) => false );
          break;
      }
    }
    
    return Scaffold(
//app bar
      appBar: AppBar(
        title: Text('WhatsApp Clone'),
        actions: <Widget>[
//search button
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context,delegate: Search([]));
            },
          ),
//menu button
          PopupMenuButton<String>(
            onSelected: _selectedItem,
            itemBuilder: (context){
              return _popupMenuList.map((String item){
                return PopupMenuItem(
                  value: item,
                  child: Text(item),);
              }).toList();
            },
          ),
          
        ],
//screens/tabs        
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3,
          labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          indicatorColor: Colors.white,
          tabs: _tabList,
        ),
      ),
//float button      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat,color: Colors.white,),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyContacts() ) );
        },
      ),
//screens/tabs view      
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          TabChats(),
          TabStatus(),
          TabCalls(),
        ],
      ),
    );
  }
}