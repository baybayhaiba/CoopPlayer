import 'package:coop_player/component/button_corner.dart';
import 'package:coop_player/component/card_notification_list_view.dart';
import 'package:coop_player/extension/context.dart';
import 'package:coop_player/home.dart';
import 'package:coop_player/model/notify.dart';
import 'package:coop_player/model/user.dart';
import 'package:coop_player/provider/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';


class NotificationScreen extends StatelessWidget {


  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserManager>(builder: (context, userManager, child) {
      if (userManager.user != null) {
        return CardNotificationListView(notifies: Notify.notifies);
      }

      return Center(
        child: ButtonCorner(
          onPressed: () async{
            final manager = Provider.of<UserManager>(context, listen: false);
            final result = await context.push(LoginScreen());
            manager.provideLogin(result);
          },
        ),
      );
    });
  }
}
