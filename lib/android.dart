import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor_app/utils.dart';
import 'Chats.dart';
import 'call.dart';
import 'mic/color.dart';
import 'settings.dart';

class Android extends StatefulWidget {
  @override
  State<Android> createState() => _AndroidState();
}

class _AndroidState extends State<Android> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool isSwitched = false;
  List<Widget> data = [Chats(), Calls(), Settings()];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: !Utils.changeDesign
                    ? AppColors.commonColor
                    : AppColors.commonColor1,
                title: Text('Platform Convertor'),
                actions: [
                  Utils.changeDesign
                      ? CupertinoSwitch(
                      value: Utils.changeDesign,
                      trackColor: Colors.red,
                      onChanged: (val) {
                        setState(() {
                          Utils.changeDesign = val;
                        });
                      })
                      : Switch(
                    value: Utils.changeDesign,
                    onChanged: (value) {
                      setState(() {
                        Utils.changeDesign = value;
                        print('isSwitched');
                      });
                    },
                  )
                ],
                bottom: Utils.changeDesign
                    ? PreferredSize(
                    child: Container(), preferredSize: Size(0, 0))
                    : TabBar(
                  controller: _tabController,
                  indicator: UnderlineTabIndicator(
                      borderSide:
                      BorderSide(width: 3, color: Colors.white),
                      insets: EdgeInsets.symmetric(horizontal: 10)),
                  labelStyle: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(text: 'CHATS'),
                    Tab(text: 'CALLS'),
                    Tab(text: 'SETTINGS'),
                  ],
                )),
            floatingActionButton: Utils.changeDesign
                ? Container()
                : FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add, size: 45),
              backgroundColor: AppColors.commonColor,
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: AppColors.commonColor),
                    accountName: Text("John Doe"),
                    accountEmail: Text('+91 3245789120'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("assets/profile.jpg"),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle_outlined, size: 30),
                    title: Text("New Contact",
                        style: TextStyle(color: AppColors.commonColor)),
                  ),
                  ListTile(
                    leading: Icon(Icons.call, size: 30),
                    title: Text("Calls",
                        style: TextStyle(color: AppColors.commonColor)),
                  ),
                  ListTile(
                    leading: Icon(Icons.bookmark_border_sharp, size: 30),
                    title: Text("saved Messages",
                        style: TextStyle(color: AppColors.commonColor)),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, size: 30),
                    title: Text("Settings",
                        style: TextStyle(color: AppColors.commonColor)),
                  ),
                ],
              ),
            ),
            body: Utils.changeDesign
                ? CupertinoTabScaffold(
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
                ))
                : TabBarView(
              controller: _tabController,
              children: [Chats(), Calls(), Settings()],
            )));
  }
}
