import 'package:flutter/material.dart';

class MessageBubbleWidget extends StatelessWidget {
  const MessageBubbleWidget({
    super.key,
    required this.text,
    required this.sender,
    required this.isMe,
  });

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: Material(
            type: MaterialType.card,
            elevation: 5.0,
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(2.0),
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0))
                : const BorderRadius.only(
                    topLeft: Radius.circular(2.0),
                    topRight: Radius.circular(16.0),
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
            color: isMe ? Colors.cyan : Colors.cyanAccent.shade100,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: isMe ? Colors.white : Colors.blueGrey.shade600,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: isMe
              ? const EdgeInsets.only(right: 20.0)
              : const EdgeInsets.only(left: 20.0),
          child: Text(
            sender,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12.0,
            ),
          ),
        ),
      ],
    );
  }
}
