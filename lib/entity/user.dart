class User{
  String _name;
  String _email;
  String _password;
  String _id;
  
  User();

  //getters
  String get name => _name;
  
  String get email => _email;
  
  String get password => _password;
  
  String get id => _id;
  
  //setters
  set name(String nome){
    _name = nome;
  }
  set email(String email){
    _email = email;
  }
  set password(String pwd){
    _password = pwd;
  }
  set id(String id){
    _id = id;
  }
}