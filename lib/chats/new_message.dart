import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  String _enterdmessage = "";
  _sendmessage() async {
    FocusScope.of(context).unfocus();
    final user =  FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get();
    FirebaseFirestore.instance.collection("chat").add({
      'text': _enterdmessage,
      "createdAt": Timestamp.now(),
      "username": userData["username"],
      "userId": user.uid,
    });
    _controller.clear();
    setState(() {
      _enterdmessage="";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: ("send a message ...")),
            onChanged: (value) {
              setState(() {
                _enterdmessage = value;
              });
            },
          )),
          IconButton(
              onPressed: _enterdmessage.trim().isEmpty ? null : _sendmessage,
              icon: Icon(Icons.send))
        ],
      ),
    );
  }
}
