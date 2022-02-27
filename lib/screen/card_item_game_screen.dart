import 'package:coop_player/model/user.dart';
import 'package:coop_player/provider/UserManager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardItemGameScreen extends StatelessWidget {
  const CardItemGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create party',
          style: GoogleFonts.lato(fontSize: 18),
        ),
      ),
      body: null
    );
  }
}
