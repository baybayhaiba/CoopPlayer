import 'package:coop_player/model/user.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Party {
  String id;
  User host;
  int amount;
  String description;
  String require;
  DateTime date;
  TimeOfDay timeToPlay;
  TimeOfDay timeOut;
  String uuidGame;

  Party(
      {required this.host,
      this.amount = 1,
      required this.require,
      required this.date,
      required this.description,
      required this.timeToPlay,
      required this.timeOut,
      required this.uuidGame})
      : id = const Uuid().v4();
}
