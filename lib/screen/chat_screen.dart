import 'package:coop_player/extension/context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/button_corner.dart';
import '../provider/user_manager.dart';
import 'login_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserManager>(builder: (context, userManager, child) {
      if (userManager.user != null) {
        return Container(
          color: Colors.green,
        );
      }

      return Center(
        child: ButtonCorner(
          onPressed: () async {
            final manager = Provider.of<UserManager>(context, listen: false);
            final result = await context.push(LoginScreen());
            manager.provideLogin(result);
          },
        ),
      );
    });
  }
}
