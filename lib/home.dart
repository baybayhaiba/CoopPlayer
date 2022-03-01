import 'package:coop_player/component/card_game_grid_view.dart';
import 'package:coop_player/component/card_notification_list_view.dart';
import 'package:coop_player/component/image_circle.dart';
import 'package:coop_player/model/game.dart';
import 'package:coop_player/model/notify.dart';
import 'package:coop_player/extension/context.dart';
import 'package:coop_player/provider/user_manager.dart';
import 'package:coop_player/screen/card_game_screen.dart';
import 'package:coop_player/screen/chat_screen.dart';
import 'package:coop_player/screen/login_screen.dart';
import 'package:coop_player/screen/notification_screen.dart';
import 'package:coop_player/screen/person_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/user.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static User? user;

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

  bool isUser(result) {
    return result != null && result is User;
  }

  void showUser(result) {
    if (isUser(result)) {
      avatarUser = ImageCircle(
        imageProvider: AssetImage(result.avatar),
        radius: 28,
      );
    }
  }

  void handleLogout(manager) {
    manager.provideLoggout();
    avatarUser = const Icon(Icons.person);
  }

  void handleLogin(manager) async {
    if (manager.user == null) {
      final result = await context.push(LoginScreen());
      showUser(result);
      manager.provideLogin(result);

      Home.user = result;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserManager>(builder: (ctx, manager, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Coop Player',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(
                iconSize: 30,
                icon: manager.user != null
                    ? ImageCircle(
                        imageProvider: AssetImage(manager.user!.avatar),
                        radius: 28,
                      )
                    : const Icon(Icons.person),
                color: Colors.white,
                onPressed: () {
                  if (manager.user != null) {
                    context.push(PersonScreen(logout: () {
                      handleLogout(manager);
                    }));
                  } else {
                    handleLogin(manager);
                  }
                }),
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
    });
  }
}
