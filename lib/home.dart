import 'package:coop_player/component/card_game_grid_view.dart';
import 'package:coop_player/component/card_notification_list_view.dart';
import 'package:coop_player/component/image_circle.dart';
import 'package:coop_player/model/game.dart';
import 'package:coop_player/model/notify.dart';
import 'package:coop_player/extension/context.dart';
import 'package:coop_player/provider/UserManager.dart';
import 'package:coop_player/screen/card_game_screen.dart';
import 'package:coop_player/screen/chat_screen.dart';
import 'package:coop_player/screen/login_screen.dart';
import 'package:coop_player/screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/user.dart';

class Home extends StatefulWidget {
  const Home({Key? key, this.user}) : super(key: key);

  final User? user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  Widget avatarUser = const Icon(Icons.person);

  List<Widget> pages = [
    const CardGameScreen(),
    const NotificationScreen(),
    const ChatScreen(),
  ];

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.videogame_asset), label: 'Games'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.notifications), label: 'Notification'),
    const BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
  ];

  void onTapBottom(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Coop Player',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            iconSize: 30,
            icon: avatarUser,
            color: Colors.white,
            onPressed: () async {
              final manager = Provider.of<UserManager>(context, listen: false);
              if (avatarUser is Icon) {
                final result = await context.push(LoginScreen());

                if (result != null && result is User) {
                  manager.provideLogin(result);
                  context.showSnackbar('Welcome to Coop Player ${result.name}');

                  setState(() {
                    avatarUser = ImageCircle(
                      imageProvider: AssetImage(result.avatar),
                      radius: 28,
                    );
                  });
                }
              } else {
                manager.provideLoggout();

                setState(() {
                  avatarUser = const Icon(Icons.person);
                });
              }
            },
          ),
        ],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onTapBottom,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
      ),
    );
  }
}
