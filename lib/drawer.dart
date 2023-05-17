import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test {
  Test({required this.icon, required this.title});
  final Icon icon;
  final String title;
}

List<Test> test = <Test>[
  Test(icon: Icon(Icons.supervisor_account_outlined), title: "New Group"),
  Test(icon: Icon(Icons.account_circle_outlined), title: "New Contact"),
  Test(icon: Icon(Icons.call), title: "Calls"),
  Test(icon: Icon(Icons.bookmark_add_outlined), title: "saved Messages"),
  Test(icon: Icon(Icons.settings), title: "Settings"),
];
