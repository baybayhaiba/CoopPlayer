import 'package:coop_player/component/card_game.dart';
import 'package:coop_player/extension/context.dart';
import 'package:coop_player/model/game.dart';
import 'package:coop_player/provider/card_manager.dart';
import 'package:coop_player/screen/detail_game_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardGameGridView extends StatelessWidget {
  final List<GameHome> games;

  const CardGameGridView({
    Key? key,
    required this.games,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: games.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (context, index) {
          final manager = Provider.of<CardManager>(context, listen: false);

          return GestureDetector(
            onTap: () {
              context.push(DetailGameScreen(
                gameHome: games[index],
                onUpdate: (party, index) {
                  manager.modifierParty(party, index);
                },
                onDelete: (party) {
                  manager.deleteParty(party);
                },
              ));
            },
            child: CardGame(gameHome: games[index]),
          );
        },
      ),
    );
  }
}
