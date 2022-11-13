import 'package:flutter/material.dart';

class Message_bubble extends StatelessWidget {
  Message_bubble(
    this.message,
    this.username,
    this.isMe,
  );

  final String message;
  final String username;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
              bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(14),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(14),
            ),
          ),
          width: 140,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                username,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                message,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                textAlign: isMe ? TextAlign.end : TextAlign.start,
              )
            ],
          ),
        )
      ],
    );
  }
}
