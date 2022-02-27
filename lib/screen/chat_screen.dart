import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/button_corner.dart';
import '../provider/UserManager.dart';

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
        child: ButtonCorner(),
      );
    });
  }
}
