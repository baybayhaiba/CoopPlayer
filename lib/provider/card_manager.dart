import 'package:coop_player/model/game.dart';
import 'package:coop_player/model/party.dart';
import 'package:flutter/material.dart';

class CardManager extends ChangeNotifier {
  // 1
  final _gameHome = GameHome.games;

  // 2
  List<GameHome> get gameHome => List.unmodifiable(_gameHome);

  // 3
  void deleteItem(int index) {
    _gameHome.removeAt(index);
    notifyListeners();
  }

  // 4
  void addItem(GameHome item) {
    _gameHome.add(item);
    notifyListeners();
  }

  void modifierParty(Party party, index) {
    final indexGameHome =
        _gameHome.indexWhere((element) => element.uuid == party.uuidGame);
    final partiesCopy = _gameHome[indexGameHome].parties;
    partiesCopy[index] = party;

    //_gameHome[indexGameHome].parties.removeAt(0);

    _gameHome[indexGameHome] =
        _gameHome[indexGameHome].copyWith(parties: partiesCopy);
    notifyListeners();
  }

  void deleteParty(Party party){
    final indexGameHome = _gameHome.indexWhere((element) => element.uuid == party.uuidGame);
    final partiesCopy = _gameHome[indexGameHome].parties;

    partiesCopy.remove(party);

    _gameHome[indexGameHome] =
        _gameHome[indexGameHome].copyWith(parties: partiesCopy);
    notifyListeners();
  }

  void addParty(Party party) {
    final indexGameHome =
        _gameHome.indexWhere((element) => element.uuid == party.uuidGame);
    final partiesCopy = _gameHome[indexGameHome].parties;
    partiesCopy.add(party);

    _gameHome[indexGameHome] =
        _gameHome[indexGameHome].copyWith(parties: partiesCopy);
    notifyListeners();
  }

  // 5
  void updateItem(GameHome item, int index) {
    _gameHome[index] = item;
    notifyListeners();
  }
}
