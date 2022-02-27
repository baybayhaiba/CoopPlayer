import 'package:coop_player/model/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CardGame extends StatelessWidget {
  final GameHome gameHome;

  const CardGame({Key? key, required this.gameHome}) : super(key: key);

  Color colorGame(count) {
    if (count > 50) {
      return Colors.green;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Stack(children: [
          Positioned(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                gameHome.count.toString(),
                style: TextStyle(
                    color: colorGame(gameHome.count),
                    fontWeight: FontWeight.bold),
              ),
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
            ),
            right: 0,
          ),
          Positioned(
            child: Container(
              child: Text(gameHome.name),
              padding: const EdgeInsets.all(10),
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ]),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(gameHome.image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
