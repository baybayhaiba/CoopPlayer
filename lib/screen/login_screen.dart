import 'package:coop_player/home.dart';
import 'package:coop_player/main.dart';
import 'package:coop_player/model/user.dart';
import 'package:coop_player/provider/user_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:coop_player/extension/context.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isShow = false;

  void onTapShowPassword() {
    setState(() {
      isShow = !isShow;
    });
  }

  Widget buildLogoGame() {
    return Container(
      width: 100,
      height: 120,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage('assets/game/logo_game.jpg'),
              fit: BoxFit.cover)),
    );
  }

  Widget buildTextFieldUsername(String label,
      {required TextEditingController controller}) {
    return TextField(
        controller: controller,
        maxLines: 1,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person_pin),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            labelText: label));
  }

  Widget buildTextFieldPassword(String label,
      {required bool isShowing, required TextEditingController controller}) {
    return TextField(
      obscureText: !isShowing,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.password),
          suffixIcon: IconButton(
              onPressed: onTapShowPassword,
              icon: Icon(!isShowing
                  ? Icons.remove_red_eye
                  : Icons.remove_red_eye_outlined)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: const OutlineInputBorder(),
          labelText: 'Password'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: context.screenSize().height / 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: buildLogoGame(),
              ),
              buildTextFieldUsername('Username', controller: _nameController),
              const SizedBox(
                height: 16,
              ),
              buildTextFieldPassword('Password',
                  isShowing: isShow, controller: _passwordController),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Dont have account ?',
                        style: GoogleFonts.lato(
                          fontSize: 12,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Register',
                            style: GoogleFonts.lato(fontSize: 13),
                          )),
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forget Password',
                        style: GoogleFonts.lato(fontSize: 13),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  constraints: const BoxConstraints.expand(
                      width: double.infinity, height: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          context,
                          User(
                              name: _nameController.text,
                              avatar: 'assets/person/person_kelvin.jpg'));
                    },
                    child: const Text('Login'),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
