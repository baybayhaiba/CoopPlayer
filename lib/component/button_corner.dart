import 'package:flutter/material.dart';

class ButtonCorner extends StatelessWidget {
  Function()? onPressed;

  ButtonCorner({Key? key,this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
        textColor: Colors.white,
        child: const Text('Please login'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.green,
        onPressed: onPressed,
      ),
    );
  }
}
