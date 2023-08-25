import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'message_bubble_widget.dart';

class MessageListView extends StatelessWidget {
  const MessageListView({
    super.key,
    required this.firebase,
    required this.collectionName,
    required this.senderNameFieldName,
    required this.messageTextFieldName,
    required this.currentUserEmail,
    required this.timestampFieldName,
  });

  final FirebaseFirestore firebase;
  // names of collection and fields from database
  final String collectionName;
  final String messageTextFieldName;
  final String senderNameFieldName;
  final String currentUserEmail;
  final String timestampFieldName;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firebase
          .collection('messages')
          .orderBy(timestampFieldName, descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        List<MessageBubbleWidget> messagesWidget = [];
        if (!snapshot.hasData) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            ),
          );
        } else {
          final messages = snapshot.data!.docs;
          for (var message in messages) {
            messagesWidget.add(MessageBubbleWidget(
              text: message['text'],
              sender: message['sender'],
              isMe: currentUserEmail == message['sender'],
            ));
          }
          return Expanded(
            child: ListView(
              reverse: true,
              children: messagesWidget,
            ),
          );
        }
      },
    );
  }
}
