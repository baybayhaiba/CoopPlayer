import 'dart:core';

import 'package:coop_player/model/party.dart';
import 'package:coop_player/model/user.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class GameHome {
  String uuid;
  String name;
  int count;
  List<Party> parties;
  String image;

  @override
  String toString() {
    return 'GameHome{uuid: $uuid, name: $name, count: $count, parties: ${parties.length}, image: $image}';
  }

  GameHome copyWith({required List<Party> parties}) {
    final uuidCopy = uuid;
    final nameCopy = name;
    final imageCopy = image;
    return GameHome(
        uuid: uuidCopy, name: nameCopy, parties: parties, image: imageCopy);
  }

  static List<GameHome> games = [
    GameHome(
        uuid: "1",
        name: "Minecraft",
        image: 'assets/game/game_one.jpg',
        parties: [
          Party(
              host: User.users.first,
              require: "For fun rank sliver",
              date: DateTime.now(),
              description: "Chơi thích thì vui vẻ ăn cướp zụt",
              timeToPlay: TimeOfDay.now(),
              timeOut: TimeOfDay.now(),
              uuidGame: "1"),
          Party(
              host: User.users.first,
              require: "For fun rank sliver",
              date: DateTime.now(),
              description: "Chơi thích thì vui vẻ ăn cướp zụt hahaha t^532♥",
              timeToPlay: TimeOfDay.now(),
              timeOut: TimeOfDay.now(),
              uuidGame: "1")
        ]),
    GameHome(
        uuid: "2",
        name: "Legend of legend",
        image: 'assets/game/game_two.png',
        parties: []),
    GameHome(
        uuid: "3",
        name: "Counter Strike",
        image: 'assets/game/game_three.jpg',
        parties: []),
    GameHome(
        uuid: "4",
        name: "PUBG",
        image: 'assets/game/game_four.jpg',
        parties: []),
    GameHome(
        uuid: "5",
        name: "Overwatch",
        image: 'assets/game/game_five.png',
        parties: []),
    GameHome(
        uuid: "6",
        name: "Fornite",
        image: 'assets/game/game_six.jpg',
        parties: []),
    GameHome(
        uuid: "7",
        name: "Fornite Prime",
        image: 'assets/game/game_seven.png',
        parties: []),
  ];

  GameHome(
      {required this.uuid,
      this.name = "Unknown",
      required this.parties,
      required this.image})
      : count = parties.length;
}
