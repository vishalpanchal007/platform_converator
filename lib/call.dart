import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'call_modal.dart';

class Calls extends StatefulWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
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
            subtitle: Text(DateFormat('MMM d,h:mm:a').format(DateTime.now())),
            trailing: Icon(
              Icons.call_sharp,
              size: 30,
              color: Color(0xff008069),
            ));
      },
    );
  }
}
