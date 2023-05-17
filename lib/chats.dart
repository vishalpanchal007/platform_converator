import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'call_modal.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemExtent: 80,
      itemBuilder: (context, int index) {
        return ListTile(
          leading: CircleAvatar(
              radius: 25, foregroundImage: AssetImage(items[index].image)),
          title: Text(items[index].title),
          subtitle: Text(items[index].title1),
          trailing: Text(DateFormat('hh:mm a').format(DateTime.now())),
        );
      },
    );
  }
}
