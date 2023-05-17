import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Chats.dart';
import 'call.dart';
import 'mic/color.dart';
import 'settings.dart';
import 'utils.dart';

class Ios extends StatefulWidget {
  const Ios({Key? key}) : super(key: key);

  @override
  State<Ios> createState() => _IosState();
}

class _IosState extends State<Ios> with SingleTickerProviderStateMixin {
  bool isSwitched = true;
  List<Widget> data = [Chats(), Calls(), Settings()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Icon(
            Icons.menu_rounded,
            color: AppColors.iostextColor,
          ),
          middle: Text(
            "Platform Convertor",
            style: TextStyle(fontSize: 25, color: AppColors.starColor),
          ),
          trailing: CupertinoSwitch(
            value: isSwitched,
            onChanged: (bool value) {
              setState(() {
                Utils.changeDesign = true;
              });
            },
          ),
        ),
        child: CupertinoTabScaffold(
            tabBuilder: (BuildContext context, int index) {
              return CupertinoTabView(
                builder: (context) {
                  return data[index];
                },
              );
            },
            tabBar: CupertinoTabBar(
              activeColor: AppColors.commonColor,
              currentIndex: 0,
              height: 80,
              iconSize: 35,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  activeIcon: Icon(CupertinoIcons.chat_bubble_2_fill),
                  icon: Icon(CupertinoIcons.chat_bubble_2),
                  label: 'Chats',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(CupertinoIcons.phone_fill),
                  icon: Icon(CupertinoIcons.phone),
                  label: 'Calls',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(CupertinoIcons.settings_solid),
                  icon: Icon(CupertinoIcons.settings),
                  label: 'Settings',
                ),
              ],
            )),
      ),
    );
  }
}
