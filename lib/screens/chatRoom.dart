import 'package:clone_whatsapp/entity/contactItem.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {

  ContactItem user;

  ChatRoom(this.user);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  TextEditingController _controllerMensagem = TextEditingController();
  
  List<String> _sampleMessages = [
    "Olá meu amigo, tudo bem?",
    "Tudo ótimo!!! e contigo?",
    "Estou muito bem!! queria ver uma coisa contigo, você vai na corrida de sábado?",
    "Não sei ainda :(",
    "Pq se você fosse, queria ver se posso ir com você...",
    "Posso te confirma no sábado? vou ver isso",
    "Opa! tranquilo",
    "Excelente!!",
    "Estou animado para essa corrida, não vejo a hora de chegar! ;) ",
    "Vai estar bem legal!! muita gente",
    "vai sim!",
    "Lembra do carro que tinha te falado",
    "Que legal!!"
  ];

  _sendMessage(String message){
    setState(() {
      _sampleMessages.add(message);
    });
  }

  _sendPicture(){

  }

  @override
  Widget build(BuildContext context) {

//appbar
    AppBar _appBar = AppBar(
      title: Text(widget.user.name),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.videocam),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.call),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
//background    
    BoxDecoration _background = BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/background.jpg"),
        fit: BoxFit.cover
      )
    ); 
//bottom textfield and button
    Row _bottomTextField =  Row(
        children: <Widget>[
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(right: 8,top: 5),
              child: TextField(
                controller: _controllerMensagem,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5),
                    hintText: "Message...",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)
                    ),
                    prefixIcon: IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: _sendPicture()
                    ),
                    suffixIcon: Container(
                  width: 75,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.attach_file),
                      VerticalDivider(
                        width: 15,
                      ),
                      Icon(Icons.camera_alt),
                    ],
                  ),
                ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Color(0xff075E54),
            child: Icon(Icons.send, color: Colors.white,),
            mini: true,
            onPressed: _sendMessage(_controllerMensagem.text),
          )
        ],
    );
//messages area
    Expanded _messagesArea = Expanded(
      child: ListView.builder(
        itemCount: _sampleMessages.length,
          itemBuilder: (context, index){
            //box size equal 80% of screen width
            double containerWidth = MediaQuery.of(context).size.width * 0.8;
            Alignment alignment;
            Color color;
            
            //friend messages
            if( index % 2 == 0 ){
              alignment = Alignment.centerLeft;
              color = Colors.white;
            }else{//my messages
              alignment = Alignment.centerRight;
              color = Color(0xffd2ffa5);
            }

            return Align(
              alignment: alignment,
              child: Padding(
                  padding: EdgeInsets.all(6),
                child: Container(
                  width: containerWidth,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Text(
                    _sampleMessages[index],
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            );
          }
      ),
    );

    return Scaffold(
      appBar: _appBar,
      body: Container(
        decoration: _background,
        child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  _messagesArea,
                  _bottomTextField,
                ],
              ),
            )
        ),
      ),
    );
  }
}