import 'package:coop_player/component/card_notification.dart';
import 'package:coop_player/model/notify.dart';
import 'package:flutter/material.dart';

class CardNotificationListView extends StatelessWidget {
  final List<Notify> notifies;

  const CardNotificationListView({Key? key, required this.notifies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return CardNotification(notify: notifies[index]);
        },
        separatorBuilder: (_, index) {
          return const SizedBox(
            height: 18,
          );
        },
        itemCount: notifies.length);
  }
}
