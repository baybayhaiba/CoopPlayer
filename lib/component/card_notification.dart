import 'package:coop_player/component/image_circle.dart';
import 'package:coop_player/model/notify.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardNotification extends StatelessWidget {
  final Notify notify;

  const CardNotification({Key? key, required this.notify}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageCircle(
              imageProvider: AssetImage(notify.user.avatar),
              radius: 28,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  buildInformation(),
                  Text(
                    notify.timeAgo,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      color: Colors.blueGrey,
      elevation: 2,
    );
  }

  Widget buildInformation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          notify.user.name,
          style: GoogleFonts.lato(fontSize: 24),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          notify.description,
          style: GoogleFonts.lato(fontSize: 12),
        ),
      ],
    );
  }
}
