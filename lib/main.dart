import 'package:coop_player/fooderlich_theme.dart';
import 'package:coop_player/home.dart';
import 'package:coop_player/provider/card_manager.dart';
import 'package:coop_player/provider/user_manager.dart';
import 'package:coop_player/component/item_card_game.dart';
import 'package:coop_player/screen/detail_game_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = FooderlichTheme.dark();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserManager()),
          ChangeNotifierProvider(create: (context) => CardManager()),
        ],
        child: const Home(),
      ),
    );
  }
}
