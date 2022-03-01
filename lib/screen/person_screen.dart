import 'package:flutter/material.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key, required this.logout}) : super(key: key);
  final Function() logout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Person')),
      body: ListView(
        children: [
          Container(
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Dark mode',
                  style: TextStyle(color: Colors.white),
                )),
            color: Colors.green,
          ),
          Container(
            child: TextButton(
              onPressed: () {
                logout();
                Navigator.pop(context);
              },
              child: Text('Logout', style: TextStyle(color: Colors.white)),
            ),
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
