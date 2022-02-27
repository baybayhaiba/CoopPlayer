import 'dart:core';

import 'package:uuid/uuid.dart';

class GameHome {
  String uuid;
  String name;
  int count;
  String image;

  static List<GameHome> games = [
    GameHome(name: "Minecraft", count: 30, image: 'assets/game/game_one.jpg'),
    GameHome(
        name: "Legend of legend", count: 21, image: 'assets/game/game_two.png'),
    GameHome(
        name: "Counter Strike", count: 23, image: 'assets/game/game_three.jpg'),
    GameHome(name: "PUBG", count: 55, image: 'assets/game/game_four.jpg'),
    GameHome(name: "Overwatch", count: 64, image: 'assets/game/game_five.png'),
    GameHome(name: "Fornite", count: 21, image: 'assets/game/game_six.jpg'),
    GameHome(
        name: "Fornite Prime", count: 41, image: 'assets/game/game_seven.png'),
  ];

  GameHome({this.name = "Unknown", this.count = 0, required this.image}): uuid = const Uuid().v4();
}
