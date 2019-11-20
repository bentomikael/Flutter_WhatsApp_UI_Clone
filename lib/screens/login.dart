
import 'package:clone_whatsapp/entity/firebaseControl.dart';
import 'package:clone_whatsapp/entity/routes.dart';
import 'package:clone_whatsapp/entity/user.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State<Login> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  String _errorMessage = '';

User _dataValidation(){
    String email = _controllerEmail.text;
    String password = _controllerPassword.text;
  
      if(email.isNotEmpty && email.contains('@')){
        if(password.isNotEmpty){
          //Sucess          
          User user = User();
          user.email = email;
          user.password = password;
          return user;
        
        }else{
          setState(() {
            _errorMessage = 'Password not be empty';
          });
          return null;
        }

      }else{
        setState(() {
        _errorMessage = 'You need put a valid email';
        });
        return null;
      }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                  child: Image.asset('assets/logo.png',width: 200,height: 150,),
                ),
//email field
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextField(
                    controller: _controllerEmail,
                    autofocus: true,
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
//password field
                TextField(
                  controller: _controllerPassword,
                    autofocus: true,
                    obscureText: true,
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
//enter button
                Padding(
                  padding: EdgeInsets.only(top: 16,bottom: 10),
                  child: RaisedButton(
                    child: Text('Entrar',style: TextStyle(color: Colors.white),),
                    color: Colors.green,
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                    onPressed: () async{
                      User validUser = _dataValidation();
                      bool validLogin = await FirebaseControl.loginUser(validUser);
                      if(validUser != null){  
                        //verify login data
                        if(validLogin){
                          Navigator.pushReplacementNamed(context, Routes.home);
                        }else{
                          setState(() {
                            _errorMessage = "User or password incorrcet";
                          });
                        }
                      }
                    },
                  ), 
                ),
//register clickable button             
                Center(
                  child: GestureDetector(
                    child: Text('Do not have an account? Register now!',
                    style: TextStyle(color: Colors.white),),
                    onTap: (){
                      Navigator.pushNamed(context, Routes.register);
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