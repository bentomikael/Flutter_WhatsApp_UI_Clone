import 'dart:io';

import 'package:clone_whatsapp/entity/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseControl{
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final Firestore firestore = Firestore.instance;
  static final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  static logout(){firebaseAuth.signOut();}

  static Future<String> getUserId()async{
    FirebaseUser user = await firebaseAuth.currentUser(); 
    return user.uid;
  }
  static verifyLoggedUser() async{
    FirebaseUser user = await firebaseAuth.currentUser();
    
    if(user != null) {
      return true;
    }else{
      return false;
    }
  }
  static savePicture(File pic)async{
    StorageReference rootFolder = firebaseStorage.ref();
    StorageReference file = rootFolder.child('perfil').child(await getUserId()+'.jpg');
    file.putFile(pic);  
  }

  static Future<bool> loginUser(User user)async{
    await firebaseAuth.signInWithEmailAndPassword(
    email: user.email,
    password: user.password
    ).catchError((erro){
      print(erro);
      return false;
    });
    return true;
  }

  static bool registerUser(User user){
    firebaseAuth.createUserWithEmailAndPassword(
      email: user.email.trim(),
      password: user.password.trim()
    ).then((newUser){
      user.id = newUser.user.uid;
      }).catchError((erro){
        print(erro);
        return false;
      });

    firestore.collection('Users').document(user.id).setData({
      'nome': user.name,
      'email': user.email,
      'criado em':DateTime.now(),
    }).catchError((error){
          print(error);
          return false;
      });
      return true;
  }

}
