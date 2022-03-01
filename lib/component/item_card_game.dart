import 'package:coop_player/component/image_circle.dart';
import 'package:coop_player/model/game.dart';
import 'package:coop_player/model/party.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCardGame extends StatelessWidget {
  final Party party;

  const ItemCardGame({Key? key, required this.party}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final game =
        GameHome.games.firstWhere((element) => element.uuid == party.uuidGame);

    final provideImage = AssetImage(game.image);

    final avatar = party.host.avatar;

    return Center(
      child: Card(
        // 1
        elevation: 2.0,
        // 2
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        // 3
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            // 4
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: provideImage,
                        fit: BoxFit.cover,
                        height: 100,
                        width: double.infinity,
                      ),
                    ),
                    ImageCircle(
                      imageProvider: AssetImage(avatar),
                    )
                  ],
                ),

                // 5
                const SizedBox(
                  height: 14.0,
                ),
                // 6

                Text(
                  game.name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(fontSize: 21),
                ),

                const SizedBox(
                  height: 14.0,
                ),

                Text(
                  party.description,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'Palatino',
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(
                  height: 14,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Start game ${party.timeToPlay.format(context)}",style: TextStyle(color: Colors.green)),
                    Text("End game ${party.timeOut.format(context)}",style: TextStyle(color: Colors.red),)
                  ],
                ),


                const SizedBox(
                  height: 14,
                ),
                
                Text("Amount : ${party.amount}",textAlign: TextAlign.end,)
              ],
            )),
      ),
    );
  }
}
