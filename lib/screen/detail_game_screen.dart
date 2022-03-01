import 'package:coop_player/component/item_card_game.dart';
import 'package:coop_player/extension/context.dart';
import 'package:coop_player/model/game.dart';
import 'package:coop_player/screen/card_game_item_screen.dart';
import 'package:flutter/material.dart';

import '../model/party.dart';

class DetailGameScreen extends StatelessWidget {
  final GameHome gameHome;
  final Function(Party, int) onUpdate;
  final Function(Party) onDelete;

  const DetailGameScreen(
      {Key? key,
      required this.gameHome,
      required this.onUpdate,
      required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text(gameHome.name)),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: const Text('Alert'),
                        content: const Text('Do you want delete it ?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Deny')),
                          TextButton(
                              onPressed: () {
                                onDelete(gameHome.parties[index]);

                                Navigator.of(context).pop();
                              },
                              child: const Text('Agree')),
                        ],
                      ));
            },
            onTap: () {
              context.push(
                CardGameItemScreen(
                  onCreate: (_) {},
                  onUpdate: (party) {
                    onUpdate(party, index);
                  },
                  party: gameHome.parties[index],
                ),
              );
            },
            child: ItemCardGame(party: gameHome.parties[index]),
          );
        },
        separatorBuilder: (ctx, index) {
          return const SizedBox(
            height: 18,
          );
        },
        itemCount: gameHome.parties.length,
        padding: const EdgeInsets.all(10.0),
      ),
    ));
  }
}
