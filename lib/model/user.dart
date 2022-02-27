import 'package:uuid/uuid.dart';

class User {
  String id;
  String name;
  String avatar;
  String username;
  String password;

  static List<User> users = [
    User(name: 'Thanh Huy', avatar: 'assets/person/person_cesare.jpeg'),
    User(name: 'Thanh Hoa', avatar: 'assets/person/person_crispy.png'),
    User(name: 'Thanh Muoi', avatar: 'assets/person/person_joe.jpeg'),
    User(name: 'Thanh Binh', avatar: 'assets/person/person_katz.jpeg'),
    User(name: 'Thanh Phung', avatar: 'assets/person/person_kevin.jpeg'),
  ];

  User(
      {required this.name,
      required this.avatar,
      this.username = "Huy2313",
      this.password = "1234567"})
      : id = const Uuid().v4();
}
