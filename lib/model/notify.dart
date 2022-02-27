import 'package:coop_player/model/user.dart';

class Notify {
  String description;
  User user;
  String timeAgo;

  static List<Notify> notifies = [
    Notify('Đã đưa lời mời cho bạn', (User.users..shuffle()).first,
        '12 minutes ago'),
    Notify('Đã đưa lời mời cho bạn', (User.users..shuffle()).first,
        '12 minutes ago'),
    Notify(
        'Đã đưa lời mời cho bạn ,'
            ' và cúng mời bạn chơi Counter Strike : Global and don3'
            '2131321135215312aaaa33231231'
            '2111'
            '44411t you know hehehe kdsadadao2012121444 ',
        (User.users..shuffle()).first,
        '24 minutes ago'),
    Notify('Đã đưa lời mời cho bạn', (User.users..shuffle()).first,
        '54 minutes ago'),
    Notify('Đã đưa lời mời cho bạn', (User.users..shuffle()).first,
        '11 minutes ago'),
    Notify('Đã đưa lời mời cho bạn', (User.users..shuffle()).first,
        '10 minutes ago'),
  ];

  Notify(this.description, this.user, this.timeAgo);
}
