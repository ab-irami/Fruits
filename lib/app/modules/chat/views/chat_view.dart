import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/constants.dart';
import 'package:get/get.dart';

List messages = ['How fast can you deliver'];

class ChatView extends StatelessWidget {
  final int? index;
  final String? sellerName;
  final String? product;
  final String? variety;
  final int? price;

  ChatView({
    this.index,
    this.sellerName,
    this.product,
    this.variety,
    this.price,
  });
  @override
  Widget build(BuildContext context) {
    var messageController = TextEditingController();
    var message;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text(
          '$sellerName',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Get.back();
          },
        ),
        titleSpacing: 3,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: barColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 5, bottom: 8, top: 8),
              child: Text(
                'Lot Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: barColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 6),
                      blurRadius: 6.0,
                      color: lightGrey,
                    ),
                  ],
                ),
                
                child: ListTile(
                  title: Text('$product'),
                  subtitle: Text('$variety'),
                  trailing: Text('\$ ${price.toString()}'),
                ),
              ),
            ),
            MessageStream(),
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: barColor,
                      ),
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                          hintText: 'Type your message here...',
                          border: InputBorder.none,
                        ),
                        onChanged: (v) {
                          message = v;
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (message != null) {
                          messages.add(message);
                        }
                        messageController.clear();
                      },
                      icon: Icon(
                        Icons.send,
                        size: 24,
                        color: barColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapShots) {
        List<MessageBubble> messageBubbles = [];
        var recMessage1 = MessageBubble(
          isMe: false,
          text: 'Hello Buyer we have Apples ready to ship',
        );
        var recMessage2 = MessageBubble(
          isMe: false,
          text: 'Do let me know',
        );
        messageBubbles.add(recMessage1);
        messageBubbles.add(recMessage2);
        var messageBubble;
        for (var message in messages) {
          messageBubble = MessageBubble(
            isMe: true,
            text: message,
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key, this.text, this.isMe}) : super(key: key);

  final String? text;
  final bool? isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment:
            isMe == true ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(10.0),
                bottomRight: const Radius.circular(10.0),
                topLeft: isMe == true
                    ? const Radius.circular(10.0)
                    : const Radius.circular(0),
                topRight: isMe == false
                    ? const Radius.circular(10.0)
                    : const Radius.circular(0)),
            color: isMe == true ? Colors.green : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Text(
                '$text',
                style: TextStyle(
                  color: isMe == true ? Colors.white : Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
