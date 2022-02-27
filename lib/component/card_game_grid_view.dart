import 'package:coop_player/component/card_game.dart';
import 'package:coop_player/model/game.dart';
import 'package:flutter/material.dart';

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
          return CardGame(gameHome: games[index]);
        },
      ),
    );
  }
}
