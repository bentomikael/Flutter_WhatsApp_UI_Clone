
import 'package:clone_whatsapp/entity/firebaseControl.dart';
import 'package:clone_whatsapp/entity/routes.dart';
import 'package:clone_whatsapp/entity/user.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _errorMessage = " ";
  //textField controllers
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerpassword = TextEditingController();

  User _validateData(){
    String name = _controllerName.text;
    String email = _controllerEmail.text;
    String password = _controllerpassword.text;
  
    if(name.length >= 3){
      if(email.isNotEmpty && email.contains('@')){
        if(password.length >= 6){
          //Sucess         
          User user = User();
          user.name = name;
          user.email = email;
          user.password = password;
          return user;   
        }else{
          setState(() {
            _errorMessage = 'Password need contains minimum 6 digits';
          });
          return null;
        }

      }else{
        setState(() {
        _errorMessage = 'You need fill a valid email';
        });
        return null;
      }
      
    }else{
      setState(() {
        _errorMessage = 'You need fill name field';
      });
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(decoration: BoxDecoration(color: Color(0xff075E54)),
        padding: EdgeInsets.all(15),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
//LOGO
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset('assets/User.png',width: 200,height: 150,),
                ),
//name textfield
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextField(
                    controller: _controllerName,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      labelText: 'name',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
//email textfield
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
//password textfield
                TextField(
                  obscureText: true,
                  controller: _controllerpassword,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
//registter button
                Padding(
                  padding: EdgeInsets.only(top: 16,bottom: 10),
                  child: RaisedButton(
                    child: Text('Register',style: TextStyle(color: Colors.white),),
                    color: Colors.green,
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                    onPressed: (){
                      
                      User validUser = _validateData();
                      if(validUser != null){
                         if(! FirebaseControl.registerUser(validUser)){
                           setState(() {
                             _errorMessage = "Data base error, check you internet connection";
                           });
                         }else{
                           Navigator.pushNamedAndRemoveUntil(context, Routes.home,(_)=>false);
                         }
                      }

                    },
                  ), 
                ),  
//error message
                Center(
                  child: Text(_errorMessage,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 10),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}