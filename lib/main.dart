import 'package:coop_player/fooderlich_theme.dart';
import 'package:coop_player/home.dart';
import 'package:coop_player/provider/UserManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = FooderlichTheme.dark();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserManager()),
        ],
        child: const Home(),
      ),
    );
  }
}
