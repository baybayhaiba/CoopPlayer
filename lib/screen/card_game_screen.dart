import 'package:coop_player/component/card_game_grid_view.dart';
import 'package:coop_player/model/game.dart';
import 'package:coop_player/screen/card_game_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:coop_player/extension/context.dart';
import 'package:provider/provider.dart';

import '../provider/card_manager.dart';

class CardGameScreen extends StatelessWidget {
  const CardGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CardManager>(builder: (context, manager, child) {
      return Scaffold(
        body: CardGameGridView(games: manager.gameHome),
        floatingActionButton: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 16, 16),
          child: FloatingActionButton(
            onPressed: () {
              context.push(CardGameItemScreen(
                onCreate: (item) {
                  manager.addParty(item);
                },
                onUpdate: (_) {},
              ));
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            backgroundColor: Colors.red,
            child: const Icon(Icons.games),
          ),
        ),
      );
    });
  }
}
