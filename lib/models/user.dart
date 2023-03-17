import 'supscription.dart';

enum UserType {
  partner,
  mentor,
  employee,
  guest,
}

class User {
  final String id;
  final String name;
  final String photo;
  final String password;
  final String email;
  final List<Subscription> subsicription;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.photo,
      required this.subsicription});

  User.empty({
    required this.id,
    required this.name,
    required this.photo,
    required this.password,
    required this.email,
    required this.subsicription,
  });
}
