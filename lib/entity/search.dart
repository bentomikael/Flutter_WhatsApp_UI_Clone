import 'package:flutter/material.dart';

class Search extends SearchDelegate<String>{

  List<String> _list;
  Search(this._list);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: (){
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          close(context, '');
        },
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    if(query.isNotEmpty){
      _list.where(
        (text) => text.toLowerCase().startsWith(query.toLowerCase())).toList();
    }
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (context,index){
        return ListTile(
          title: Text(_list[index]),
          onTap: (){close(context,_list[index]);},
        );
      },
    );
  }


} 